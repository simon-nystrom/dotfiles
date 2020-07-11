zmodload zsh/complist
autoload -Uz compinit && compinit

# Allow menu selection for completions
zstyle ':completion:*' menu select

# Case insensitive matching
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# Colorize completions
zstyle ':completion:*' list-colors ''

# Load z
. /usr/local/bin/z.sh

# Load prompt
. ~/.zsh/.prompt.sh

# Load aliases 
. ~/.zsh/.alias.sh

# Smarter search that finds the previous/next command that shares the currently typed prefix
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# History settings
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt inc_append_history
setopt share_history

. /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh