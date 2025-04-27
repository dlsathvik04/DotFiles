return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
  dependencies = {
    "nvim-telescope/telescope.nvim",
    -- "ibhagwan/fzf-lua",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    lang = "python3", -- NOTICE: it expects "python3", not "python"
    storage = {
      home = vim.fn.expand("~/WORK/leetcode"), -- use "home" not "directory"
    },
  },
}
