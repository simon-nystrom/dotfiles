function git_prompt {
    if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) = true ]]; then
        echo "%F{blue}(%f%F{red}$(git rev-parse --abbrev-ref HEAD)%f""%F{blue})%f"
    fi
}

setopt PROMPT_SUBST
    
RPROMPT="\$(git_prompt)"

if [[ "$EUID" -eq 0 ]]; then 
    RPROMPT="%K{red} WARNING: Running as root %k"
fi

PROMPT="%F{cyan} %~ %B➜%b%f "