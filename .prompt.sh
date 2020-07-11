function git_prompt {
    if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) = true ]]; then
        local git_status=$(git status --porcelain | wc -l)
        local icon=$([[ $git_status -eq 0 ]] && echo "%F{green}✔%f" || echo "%F{red}✗%f")
        echo "%F{cyan}git:($(git rev-parse --abbrev-ref HEAD))%f $icon"
    fi
}

setopt PROMPT_SUBST
    
RPROMPT="\$(git_prompt)"

if [[ "$EUID" -eq 0 ]]; then 
    RPROMPT="%K{red} WARNING: Running as root %k"
fi

PROMPT="%F{green}%~ %f%F{green}%B➜%b%f "