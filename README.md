# Dotfiles

Dotfiles for an Ubuntu-first WSL setup, managed with GNU Stow. Most configs are stored in app-specific folders and symlinked into `$HOME`.

## Ubuntu / WSL setup

Install the base Ubuntu packages:

```bash
sudo apt update
xargs -a ubuntu_packages sudo apt install -y
```

Stow the configs you want from the repo root:

```bash
stow zsh nvim wezterm mise
```

You can stow more packages the same way, for example:

```bash
stow atuin bat btop gdu lazygit pypoetry vscode zellij
```

To remove or refresh a stowed config:

```bash
stow -D nvim
stow -R nvim
```

## Shell

The Ubuntu package list installs `zsh` and common shell integrations. To make zsh the login shell:

```bash
chsh -s "$(command -v zsh)"
```

Restart the terminal after changing the shell. For an existing session, run:

```bash
exec zsh
```

Optional local .zshrc overlay gets auto imported if it exists:

```bash
~/.zshrc_extra
```

## Tools

The apt package list covers the baseline packages needed for this setup, including `stow`, `zsh`, Python helpers, and build tools.

## Addendum: native Windows symlinks

On native Windows, config paths may differ from Linux/WSL. If needed, start PowerShell as Administrator and create manual symlinks:

```powershell
cmd /c mklink /d C:\Users\<username>\AppData\Local\nvim C:\Users\<username>\dotfiles\nvim\.config\nvim
cmd /c mklink /d C:\Users\<username>\.config\wezterm C:\Users\<username>\dotfiles\wezterm\.config\wezterm

cmd /c mklink "C:\Users\<username>\AppData\Roaming\Code\User\settings.json" "C:\Users\<username>\dotfiles\vscode\.config\Code\User\settings.json"
cmd /c mklink "C:\Users\<username>\AppData\Roaming\Code\User\keybindings.json" "C:\Users\<username>\dotfiles\vscode\.config\Code\User\keybindings.json"
```
