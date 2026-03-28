local M = {}

-- Cache for git branch per buffer
local git_cache = {}

local function mode_label()
	local mode_map = {
		n = "NORMAL ",
		i = "INSERT ",
		v = "VISUAL ",
		V = "V-LINE ",
		["\22"] = "V-BLOCK",
		c = "COMMAND",
		s = "SELECT ",
		S = "S-LINE ",
		R = "REPLACE",
		r = "PROMPT ",
		t = "TERM   ",
	}
	return mode_map[vim.api.nvim_get_mode().mode] or "OTHER"
end

local function update_git_branch_async(bufnr, cwd)
	-- Use gitsigns data if available (fastest)
	local buf = bufnr or vim.api.nvim_get_current_buf()
	if vim.b[buf].gitsigns_head and vim.b[buf].gitsigns_head ~= "" then
		git_cache[cwd] = vim.b[buf].gitsigns_head
		return
	end

	-- Check if in a git repo
	local git_dir = vim.fn.finddir(".git", cwd .. ";")
	if git_dir == "" then
		git_cache[cwd] = ""
		return
	end

	-- Async git call using vim.system (Neovim 0.10+) or fallback
	if vim.system then
		vim.system({ "git", "branch", "--show-current" }, {
			cwd = cwd,
			text = true,
		}, function(obj)
			if obj.code == 0 then
				vim.schedule(function()
					git_cache[cwd] = obj.stdout:gsub("%s+$", "")
					vim.cmd("redrawstatus")
				end)
			else
				git_cache[cwd] = ""
			end
		end)
	else
		-- Fallback for older Neovim versions
		git_cache[cwd] = ""
	end
end

local function git_branch()
	local cwd = vim.fn.getcwd()
	
	-- Return cached value if exists
	if git_cache[cwd] ~= nil then
		return git_cache[cwd]
	end
	
	-- Initialize cache with empty and trigger async update
	git_cache[cwd] = ""
	update_git_branch_async(nil, cwd)
	
	return ""
end

function M.render()
	local mode = "%#StatusLineMode# " .. mode_label() .. " %*"
	local branch_name = git_branch()
	local branch = ""
	if branch_name ~= "" then
		branch = "%#StatusLineGit#  " .. branch_name .. " %*"
	end
	local file = "%#StatusLineFile# %f %m%r %*"
	local info = "%#StatusLineInfo# %= %y  %l:%c  %p%% %*"
	return table.concat({
		mode,
		branch,
		file,
		info,
	})
end

function M.setup()
	_G.my_statusline = M.render
	vim.o.statusline = "%!v:lua.my_statusline()"
	
	-- Redraw statusline on visual changes
	vim.api.nvim_create_autocmd({
		"ModeChanged",
		"BufEnter",
		"BufWritePost",
		"FocusGained",
		"TermOpen",
		"TermEnter",
	}, {
		callback = function()
			vim.cmd("redrawstatus")
		end,
	})

	-- Update git cache on directory/buffer changes
	vim.api.nvim_create_autocmd({
		"BufEnter",
		"DirChanged",
		"FocusGained",
	}, {
		callback = function()
			local cwd = vim.fn.getcwd()
			local bufnr = vim.api.nvim_get_current_buf()
			update_git_branch_async(bufnr, cwd)
		end,
	})

	vim.api.nvim_create_autocmd("TermOpen", {
		callback = function()
			vim.wo.winhighlight = table.concat({
				"Normal:ToggleTermNormal",
				"NormalFloat:ToggleTermNormal",
				"FloatBorder:ToggleTermBorder",
			}, ",")
		end,
	})
end

return M
