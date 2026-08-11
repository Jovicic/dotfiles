# AGENTS.md

This file guides AI assistants when working in this dotfiles repository.

## Repository overview
- GNU Stow manages symlinks from this repo into the home directory.
- Primary environment is Ubuntu on WSL. Plain Linux should follow the same structure; Windows-specific setup is manual and secondary.
- Each stowed app should keep the shape it needs under `$HOME`. Most app configs live in `<app>/.config/<app>/`, which becomes `~/.config/<app>/` after stowing.
- `.stowrc` sets `--target=~/`, so run `stow` from the repo root.

## Setup expectations
- Ubuntu base packages are listed in `ubuntu_packages` and can be installed with apt, for example:
  ```bash
  sudo apt update
  xargs -a ubuntu_packages sudo apt install -y
  ```
- Keep package lists as plain package names, one per line, unless the consuming command changes.

## Key technologies
- Neovim: AstroNvim + Lazy.nvim
  - Entry points: `nvim/.config/nvim/init.lua` -> `lua/lazy_setup.lua` -> `lua/polish.lua`
  - Formatting: Stylua, configured by `nvim/.config/nvim/.stylua.toml`
  - Linting: Selene, configured by `nvim/.config/nvim/selene.toml`
  - Do not commit `nvim/.config/nvim/lazy-lock.json`; it is intentionally ignored.
- Zsh: Zim framework
  - Main file: `zsh/.zshrc`
  - Plugin definition: `zsh/.zimrc`
  - Optional untracked overlays: `~/.zshpersonal`, `~/.zshwork`
- Mise: `mise/.config/mise/config.toml`
- WezTerm: `wezterm/.config/wezterm/wezterm.lua`
- Other stowable configs include Atuin, Bat, Btop, Gdu, IdeaVim, Lazygit, Poetry, VS Code-family editors, and Zellij.

## Common commands
- Stow one or more configs:
  ```bash
  stow zsh nvim wezterm mise
  ```
- Remove or restow a config:
  ```bash
  stow -D nvim
  stow -R nvim
  ```

## Verification after edits
- Zsh: `source ~/.zshrc` or start a new shell.
- Neovim: open `nvim`, then run `:checkhealth`.
- WezTerm: restart or reload the config.
- Stow structure: run `stow -n -v <app>` for a dry run when changing package layout.

## Change guidelines
- Keep edits minimal and scoped to the requested config or documentation.
- Preserve Unix line endings.
- Follow the existing `<app>/.config/<app>/` layout unless the target program expects a different home-relative path.
- Prefer explicit, readable configuration over clever indirection.
- Do not reformat unrelated files.
- Do not commit generated lockfiles from plugin managers.

## Windows notes
- Windows paths and config locations can differ from Linux/WSL.
- Manual symlinks may be needed for native Windows tools.
- Keep Windows-only instructions in README addenda unless the task is specifically about Windows.
