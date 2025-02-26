-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        signcolumn = "yes:2", -- sets vim.opt.signcolumn
        -- numberwidth = 4, --width of the number column
        scrolloff = 10, -- number of lines to keep above and below the cursor
        foldcolumn = "0", -- disable foldcolumn
        foldenable = false, -- disable folding
        showtabline = 0, -- disable the tabline display
        updatetime = 50, -- decrease update time
        relativenumber = false,
      },
      g = {
        python3_host_prog = (vim.uv.os_uname().sysname == "Linux" and "/usr/bin/python3" or nil),
      },
    },
    autocmds = {
      disable_mouse_info_popup = {
        {
          event = "VimEnter",
          desc = "Remove the 'How-to disable mouse' popup",
          callback = function()
            vim.cmd "aunmenu PopUp.How-to\\ disable\\ mouse"
            vim.cmd "aunmenu PopUp.-1-"
          end,
        },
      },
      nvim_create_autocmd = {
        {
          event = "FileType",
          desc = "Remove 'o' from formatoptions for all filetypes, disabling auto-insertion of comment on new line when pressing `o` in normal mode",
          pattern = "*",
          callback = function() vim.opt.formatoptions:remove "o" end,
        },
      },
    },
  },
}
