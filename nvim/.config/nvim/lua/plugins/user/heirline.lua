return {
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
}
