return {
  -- arrow bookmarking plugin (harpoon-like)
  {
    "otavioschwanck/arrow.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.show_icons = true
      opts.leader_key = ";" -- Recommended to be a single key
      opts.buffer_leader_key = "m" -- Per Buffer Mappings
      opts.save_key = "git_root"
      opts.per_buffer_config = {
        lines = 5,
      }
    end,
  },
}
