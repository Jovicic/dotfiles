-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

if vim.g.vscode == true then return {} end

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    -- colorscheme = "tokyonight-storm",
    colorscheme = "kanagawa-wave",
    -- colorscheme = "tokyonight-storm",
    -- colorscheme = "catppuccin-macchiato",
  },
}
