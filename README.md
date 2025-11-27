Use `stow` to symlink each required app config.  
`stow` will be installed using homebrew. See `homebrew.txt` for the packages to install.

If only `nvim` and `wezterm` are needed, inside the `dotfiles` folder do:
```
stow nvim
stow wezterm
```

On Windows, you probably want to symlink manually. Start a powershell as Admin and do:
```
cmd /c mklink /d C:\Users\<username>\AppData\Local\nvim C:\Users\<username>\dotfiles\nvim\.config\nvim
cmd /c mklink /d C:\Users\<username>\.config\wezterm C:\Users\<username>\dotfiles\wezterm\.config\wezterm

cmd /c mklink "C:\Users\<username>\AppData\Roaming\Code\User\settings.json" "C:\Users\<username>\dotfiles\vscode\.config\Code\User\settings.json"
cmd /c mklink "C:\Users\<username>\AppData\Roaming\Code\User\keybindings.json" "C:\Users\<username>\dotfiles\vscode\.config\Code\User\keybindings.json"
```
On Windows the settings directories might not match those on linux, as seen in this example.

To use `sudo` with homebrew installed programs (`sudo nvim`),  
you can append the homebrew bin path (`/home/linuxbrew/.linuxbrew/bin`) to the `secure_path` variable in `/etc/sudoers` using:
```
sudo visudo
```

If you installed `zsh` using homebrew and want to use it as your login shell,  
add its path(`/home/linuxbrew/.linuxbrew/bin/zsh`) first to `/etc/shells`, and then run:
```
chsh
```

