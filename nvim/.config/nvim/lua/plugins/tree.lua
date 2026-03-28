return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		sources = { "filesystem" },

		close_if_last_window = true,
		popup_border_style = "single",
		use_popups_for_input = false,

		enable_git_status = true,
		git_status_async = true,
		git_status_scope_to_path = true,

		default_component_configs = {
			indent = {
				with_expanders = false,
			},
			git_status = {
				symbols = {
					added = "",
					modified = "",
					deleted = "x",
					renamed = "r",
					untracked = "?",
					ignored = "",
					unstaged = "*",
					staged = "+",
					conflict = "!",
				},
			},
		},

		filesystem = {
			hijack_netrw_behavior = "open_default",
			use_libuv_file_watcher = false,
			filtered_items = {
				visible = false,
				hide_dotfiles = false,
				hide_gitignored = false,
			},
			follow_current_file = {
				enabled = true,
				leave_dirs_open = false,
			},
		},

		window = {
			position = "left",
			width = 32,
			auto_expand_width = false,
			mappings = {
				["<cr>"] = "open",
				["l"] = "open",
				["h"] = "close_node",
				["<bs>"] = "navigate_up",
				["."] = "set_root",
				["a"] = {
					"add",
					config = {
						show_path = "relative",
					},
				},
				["d"] = "delete",
				["r"] = "rename",
				["q"] = "close_window",
				["P"] = "toggle_preview",
				["O"] = function(state)
					local node = state.tree:get_node()
					local path = node:get_id()

					if vim.fn.has("mac") == 1 then
						vim.fn.jobstart({ "open", "-R", path }, { detach = true })
					elseif vim.fn.has("unix") == 1 then
						vim.fn.jobstart({ "xdg-open", vim.fn.fnamemodify(path, ":h") }, { detach = true })
					elseif vim.fn.has("win32") == 1 then
						vim.fn.jobstart({ "explorer", "/select,", path }, { detach = true })
					end
				end,
			},
		},

		event_handlers = {
			{
				event = "file_opened",
				handler = function()
					require("neo-tree.command").execute({ action = "close" })
				end,
			},
		},
	},

	config = function(_, opts)
		require("neo-tree").setup(opts)

		vim.keymap.set("n", "<leader>e", function()
			require("neo-tree.command").execute({
				toggle = true,
				reveal = true,
			})
		end, { silent = true })

		vim.keymap.set("n", "<leader>o", "<cmd>Neotree close<cr>", { silent = true })
	end,
}
