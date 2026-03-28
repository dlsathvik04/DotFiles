return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		open_mapping = [[<C-/>]],
		shade_terminals = false,
		persist_size = false,
		persist_mode = false,

		-- Use a function so horizontal/vertical terminals both size correctly.
		size = function(term)
			if term.direction == "horizontal" then
				return 16
			elseif term.direction == "vertical" then
				return math.floor(vim.o.columns * 0.40)
			end
			return 20
		end,
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)
		require("custom.toggleterm_ipy").setup({
			cmd = vim.fn.executable("ipython") == 1 and "ipython" or "python",
			direction = "vertical", -- change to "vertical" if you prefer
			size = 60,
			count = 99,
		})
	end,
}
