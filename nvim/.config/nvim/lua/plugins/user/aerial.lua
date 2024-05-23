return {
  -- restore some defaults of aerial.nvim
  {
    "stevearc/aerial.nvim",
    opts = function(_, opts)
      opts.filter_kind = {
        "Class",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Module",
        "Method",
        "Struct",
      }
    end,
  },
}
