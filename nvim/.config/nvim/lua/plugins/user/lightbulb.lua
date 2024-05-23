return {
  -- Show a lightbulb where a code action is available
  {
    "kosayoda/nvim-lightbulb",
    enabled = vim.g.codeactions_enabled,
    event = "User BaseFile",
    opts = {
      action_kinds = { -- show only for relevant code actions.
        "quickfix",
      },
      ignore = {
        ft = { "lua" }, -- ignore filetypes with bad code actions.
      },
      autocmd = {
        enabled = true,
        updatetime = 100,
      },
      sign = { enabled = false },
      virtual_text = {
        enabled = true,
        text = "💡",
      },
    },
    config = function(_, opts) require("nvim-lightbulb").setup(opts) end,
  },
}
