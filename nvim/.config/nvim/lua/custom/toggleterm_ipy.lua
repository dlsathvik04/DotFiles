local M = {}

local defaults = {
	cmd = "python",
	direction = "horizontal",
	size = 16,
	count = 99,
	cell_delimiter = "^# %%",
}

function M.setup(user_opts)
	local ok, terminal = pcall(require, "toggleterm.terminal")
	if not ok then
		vim.notify("toggleterm.terminal not found", vim.log.levels.ERROR)
		return
	end

	local opts = vim.tbl_deep_extend("force", defaults, user_opts or {})
	local Terminal = terminal.Terminal

	local repl

	local function create_repl()
		repl = Terminal:new({
			cmd = opts.cmd,
			count = opts.count,
			hidden = true,
			close_on_exit = false,
			direction = opts.direction,
			size = opts.size,
			on_open = function()
				-- Keep editor focus after opening the REPL window.
				vim.schedule(function()
					local prev = vim.g.__python_repl_prev_win
					if prev and vim.api.nvim_win_is_valid(prev) then
						vim.api.nvim_set_current_win(prev)
					end
				end)
			end,
		})
	end

	local function current_win()
		return vim.api.nvim_get_current_win()
	end

	local function valid_win(win)
		return win and vim.api.nvim_win_is_valid(win)
	end

	local function remember_win()
		vim.g.__python_repl_prev_win = current_win()
	end

	local function restore_win()
		local prev = vim.g.__python_repl_prev_win
		if valid_win(prev) then
			vim.schedule(function()
				if valid_win(prev) then
					vim.api.nvim_set_current_win(prev)
				end
			end)
		end
	end

	local function ensure_repl()
		if repl then
			return repl
		end
		create_repl()
		return repl
	end

	local function open_repl_keep_focus()
		local term = ensure_repl()
		if term:is_open() then
			return
		end

		remember_win()
		term:open(opts.size, opts.direction)
		restore_win()
	end

	local function toggle_repl_keep_focus()
		local term = ensure_repl()
		remember_win()
		term:toggle(opts.size, opts.direction)
		restore_win()
	end

	local function send_text(text)
		local term = ensure_repl()
		open_repl_keep_focus()

		vim.defer_fn(function()
			-- IMPORTANT:
			-- go_back = true keeps focus in the editing window.
			term:send(text, true)
			restore_win()
		end, 20)
	end

	local function get_visual_lines()
		local start_line = vim.fn.line("'<")
		local end_line = vim.fn.line("'>")
		if start_line > end_line then
			start_line, end_line = end_line, start_line
		end
		return vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
	end

	local function send_line()
		local line = vim.api.nvim_get_current_line()
		send_text(line .. "\n")
	end

	local function send_selection()
		local lines = get_visual_lines()
		if #lines == 0 then
			return
		end
		send_text(table.concat(lines, "\n") .. "\n")
	end

	local function find_cell_bounds()
		local cur = vim.fn.line(".")
		local last = vim.fn.line("$")
		local start_line = 1
		local end_line = last

		for i = cur, 1, -1 do
			if vim.fn.getline(i):match(opts.cell_delimiter) then
				start_line = i + 1
				break
			end
		end

		for i = cur + 1, last do
			if vim.fn.getline(i):match(opts.cell_delimiter) then
				end_line = i - 1
				break
			end
		end

		return start_line, end_line
	end

	local function send_cell()
		local start_line, end_line = find_cell_bounds()
		local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
		if #lines == 0 then
			return
		end
		send_text(table.concat(lines, "\n") .. "\n")
	end

	local function new_cell()
		local row = vim.api.nvim_win_get_cursor(0)[1]
		vim.api.nvim_buf_set_lines(0, row, row, false, {
			"",
			"# %%",
			"",
		})
		vim.api.nvim_win_set_cursor(0, { row + 2, 0 })
	end

	local function restart_repl()
		local term = ensure_repl()

		pcall(function()
			term:shutdown()
		end)

		repl = nil
	end

	local function shutdown_repl()
		local term = ensure_repl()

		pcall(function()
			term:shutdown()
		end)

		repl = nil
		create_repl()
		open_repl_keep_focus()
		vim.notify("Python REPL restarted", vim.log.levels.INFO)
	end

	vim.api.nvim_create_autocmd("FileType", {
		pattern = "python",
		callback = function(event)
			local mapopts = { buffer = event.buf, silent = true, noremap = true }

			vim.keymap.set(
				"n",
				"<leader>pt",
				toggle_repl_keep_focus,
				vim.tbl_extend("force", mapopts, {
					desc = "Toggle Python REPL",
				})
			)

			vim.keymap.set(
				"n",
				"<leader>pl",
				send_line,
				vim.tbl_extend("force", mapopts, {
					desc = "Send line to Python REPL",
				})
			)

			vim.keymap.set(
				"v",
				"<leader>ps",
				send_selection,
				vim.tbl_extend("force", mapopts, {
					desc = "Send selection to Python REPL",
				})
			)

			vim.keymap.set(
				"n",
				"<leader>pc",
				send_cell,
				vim.tbl_extend("force", mapopts, {
					desc = "Send cell to Python REPL",
				})
			)

			vim.keymap.set(
				"n",
				"<leader>pn",
				new_cell,
				vim.tbl_extend("force", mapopts, {
					desc = "Insert new cell",
				})
			)

			vim.keymap.set(
				"n",
				"<leader>prr",
				restart_repl,
				vim.tbl_extend("force", mapopts, {
					desc = "Restart Python REPL",
				})
			)

			vim.keymap.set(
				"n",
				"<leader>pcr",
				restart_repl,
				vim.tbl_extend("force", mapopts, {
					desc = "Shutdown Python REPL",
				})
			)
			vim.keymap.set(
				"n",
				"]c",
				function()
					vim.fn.search(opts.cell_delimiter)
				end,
				vim.tbl_extend("force", mapopts, {
					desc = "Next cell",
				})
			)

			vim.keymap.set(
				"n",
				"[c",
				function()
					vim.fn.search(opts.cell_delimiter, "b")
				end,
				vim.tbl_extend("force", mapopts, {
					desc = "Previous cell",
				})
			)
		end,
	})
end

return M
