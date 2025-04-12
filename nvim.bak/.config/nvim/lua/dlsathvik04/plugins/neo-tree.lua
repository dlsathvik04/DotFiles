return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
        -- fill any relevant options here
    },
    config = function()
        require("neo-tree").setup({
            event_handlers = {
                {
                    event = "file_open_requested",
                    handler = function()
                        -- auto close
                        -- vim.cmd("Neotree close")
                        -- OR
                        require("neo-tree.command").execute({ action = "close" })
                    end,
                },
            },
        })
        vim.keymap.set("n", "<C-E>", ":Neotree filesystem toggle left<CR>", {})
    end,
}
