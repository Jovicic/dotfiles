return {
  -- change neo-tree opening behaviour to default
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts) opts.filesystem.hijack_netrw_behavior = "open_default" end,
  },
}
