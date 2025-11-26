# Add deno completions to search path
if [[ ":$FPATH:" != *":~/.zsh/completions:"* ]]; then export FPATH="~/.zsh/completions:$FPATH"; fi
AUTOSWITCH_DEFAULT_PYTHON="/usr/bin/python3"
# setup homebrew
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# add zsh completions installed by homebrew
# fpath+=($(brew --prefix)/share/zsh/site-functions)

# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
# }}} End configuration added by Zim install

# Created by user for 5.9
# setup your config below

# setup env vars
export EDITOR=nvim  # set standard editor
export AUTOSWITCH_SILENT=1  # don't show python virtualenv switch messages
# export HOMEBREW_NO_ANALYTICS=1  # don't send analytics to homebrew
# export DOTNET_ROOT="$(brew --prefix)/opt/dotnet/libexec"
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
export BUN_INSTALL="$HOME/.bun"
export UV_MANAGED_PYTHON=true

# setup paths
path+=($HOME/.local/bin)
path+=(/opt/zig14)
# path+=($HOME/apps/zig13)
# path+=(/opt/nvim)
path+=($BUN_INSTALL/bin)
export PATH

# setup aliases
alias vim=nvim
alias ls=lsd
# alias bat=batcat
# alias gdu=gdu-go

# initialize additional tools
eval "$(zoxide init zsh)"
# eval "$(fzf --zsh)"
eval "$($HOME/.local/bin/mise activate zsh)"
eval "$(atuin init zsh)"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# User specific environment and startup programs
# . "$HOME/.cargo/env"

eval "$(atuin init zsh)"

. "~/.deno/env"

# Source work .zshrc if it exists
if [ -f ~/.zshrc_work ]; then
  source ~/.zshrc_work
fi

# Source personal .zshrc if it exists
if [ -f ~/.zshrc_personal ]; then
  source ~/.zshrc_personal
fi
# export $(dbus-launch)

alias claude="~/.claude/local/claude"

# Load optional personal/work configurations
# These files are not tracked in git and contain sensitive/machine-specific settings
[[ -f ~/.zshpersonal ]] && source ~/.zshpersonal
[[ -f ~/.zshwork ]] && source ~/.zshwork


# bun completions
[ -s "/home/nebo/.bun/_bun" ] && source "/home/nebo/.bun/_bun"
. "/home/nebo/.deno/env"
