return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			panel = {
				enabled = false,
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 75,
				keymap = {
					accept = "<Tab>",
					dismiss = "<C-e>",
					next = "<M-]>",
					prev = "<M-[>",
				},
			},
			filetypes = {
				yaml = false,
				markdown = false,
				help = false,
				gitcommit = false,
				gitrebase = false,
				["*"] = true,
			},
		})

		local function copilot_enabled()
			return vim.b.copilot_enabled ~= false
		end

		vim.keymap.set("n", "<leader>ct", function()
			if copilot_enabled() then
				vim.cmd("Copilot disable")
				vim.notify("Copilot OFF", vim.log.levels.INFO)
			else
				vim.cmd("Copilot enable")
				vim.notify("Copilot ON", vim.log.levels.INFO)
			end
		end, { desc = "Toggle Copilot" })

		vim.keymap.set("n", "<leader>cs", "<cmd>Copilot status<cr>", {
			desc = "Copilot Status",
			silent = true,
		})

		vim.keymap.set("n", "<leader>ca", "<cmd>Copilot auth<cr>", {
			desc = "Copilot Auth",
			silent = true,
		})
	end,
}
