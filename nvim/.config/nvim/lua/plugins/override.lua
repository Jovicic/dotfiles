return {
  -- enable arrow bookmarking plugin (harpoon like)
  {
    "otavioschwanck/arrow.nvim",
    -- lazy = true,
    opts = {
      show_icons = true,
      leader_key = ";", -- Recommended to be a single key
      -- buffer_leader_key = 'm', -- Per Buffer Mappings
    },
  },
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   opts = function(_, opts)
  --     opts.close_if_last_window = false
  --     return opts
  --   end,
  -- },

  -- disable default notifications
  -- { "rcarriga/nvim-notify", enabled = false },

  -- enable minimal notifications
  -- {
  --   "j-hui/fidget.nvim",
  --   opts = {
  --     notification = {
  --       override_vim_notify = true,
  --     },
  --   },
  -- },
}
