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

  -- custom statusline
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astroui.status"
      local fileNameBlock = require "plugins.custom.filename"

      opts.statusline = {
        -- statusline
        hl = { fg = "fg", bg = "bg" },
        status.component.mode {
          mode_text = { padding = { left = 1, right = 1 } },
        }, -- add the mode text
        status.component.builder {
          { provider = function() return vim.bo.fenc end },
          surround = {
            separator = "left",
            condition = function() return vim.bo.fenc ~= "utf-8" end,
          },
          hl = { fg = "orange" },
          update = "BufModifiedSet",
        },
        status.component.git_branch(),
        status.component.git_diff(),
        status.component.diagnostics(),
        fileNameBlock,
        status.component.fill(),
        status.component.cmd_info(),
        status.component.fill(),
        status.component.lsp(),
        status.component.virtual_env(),
        status.component.treesitter(),
        status.component.nav(),
        status.component.mode { surround = { separator = "right" } },
      }
    end,
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
