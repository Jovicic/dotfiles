local leet_arg = "leetcode.nvim"

return {
  -- leetcode plugin. start with 'nvim leetcode.nvim'
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
      -- "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = leet_arg ~= vim.fn.argv()[1],
    opts = {
      lang = "python3", -- default language
      image_support = true,
      arg = leet_arg,
    },
  },
}
