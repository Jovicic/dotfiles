return {
  -- disable default notifications
  { "rcarriga/nvim-notify", enabled = false },

  -- enable minimal notifications
  {
    "j-hui/fidget.nvim",
    opts = {
      notification = {
        override_vim_notify = true,
      },
    },
  },
}
