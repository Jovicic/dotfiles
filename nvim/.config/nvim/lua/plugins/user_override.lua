local leet_arg = "leetcode.nvim"

return {
  -- change neo-tree opening behaviour to default
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts) opts.filesystem.hijack_netrw_behavior = "open_default" end,
  },

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

  -- custom statusline
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astroui.status"
      local is_available = require("astrocore").is_available
      local arrow_statusline
      if is_available "arrow.nvim" then arrow_statusline = require "arrow.statusline" end

      -- define the arrow component
      local arrow = function()
        return status.component.builder {
          provider = function()
            if arrow_statusline and arrow_statusline.is_on_arrow_file() then
              return arrow_statusline.text_for_statusline_with_icons()
            end
          end,
          hl = { fg = "treesitter_fg", bold = true },
        }
      end

      -- define the encoding component
      local file_encoding = function()
        return status.component.builder {
          provider = function() return vim.bo.fenc end,
          surround = {
            separator = "left",
            condition = function() return vim.bo.fenc ~= "utf-8" end,
          },
          hl = { fg = "git_changed" },
          update = "BufModifiedSet",
        }
      end

      -- rebuild the statusline
      opts.statusline = {
        hl = { fg = "fg", bg = "bg" },
        status.component.mode {
          mode_text = { padding = { left = 1, right = 1 } },
        }, -- add the mode text
        file_encoding(),
        status.component.git_branch(),
        status.component.git_diff(),
        status.component.diagnostics(),
        status.component.fill(),
        arrow(),
        status.component.file_info {
          filename = { modify = ":." },
          filetype = false,
          file_modified = { hl = {
            fg = "orange",
          } },
        }, -- add relative path to the filename
        status.component.fill(),
        status.component.cmd_info(),
        status.component.lsp { lsp_progress = false }, -- progress is handled by fidget
        status.component.virtual_env(),
        status.component.treesitter(),
        status.component.nav(),
        status.component.mode { surround = { separator = "right" } },
      }
      -- rebuild the statuscolumn
      opts.statuscolumn = {
        init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
        status.component.foldcolumn(),
        status.component.signcolumn(), -- set signcolumn before numbercolumn
        status.component.numbercolumn { numbercolumn = { culright = false } }, -- don't align the current line number to the right
      }

      -- remove the tabline definition
      opts.tabline = nil
    end,
  },

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
  -- treesitter textobjects peek config
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.textobjects = {
        lsp_interop = {
          enable = true,
          border = "none",
          peek_definition_code = {
            ["<leader>df"] = "@function.outer",
            ["<leader>dF"] = "@function.inner",
          },
        },
      }
    end,
  },
}
