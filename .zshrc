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
. ~/.zsh/prompt.sh

#Load aliases
. ~/.zsh/alias.sh

# Smarter search that finds the previous/next command that shares the currently typed prefix
bindkey '^[[A' up-line-or-search                                                
bindkey '^[[B' down-line-or-search

# History settings
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

