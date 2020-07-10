function git_prompt {
    if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) = true ]]; then
        local git_status=$(git status --porcelain | wc -l)
        local sign=$([[ $git_status -eq 0 ]] && echo "%F{green}✔%f" || echo "%F{red}✗%f")
        echo "%F{cyan}git:($(git rev-parse --abbrev-ref HEAD))%f $sign"
    fi
}

setopt PROMPT_SUBST
    
RPROMPT="\$(git_prompt)"

if [[ "$EUID" -eq 0 ]]; then 
    RPROMPT="%K{red} WARNING: Running as root %k"
fi

# ✓

# PROMPT="%F{#5ff967}%~ %f%F{#5ff967}%B➜%b%f "
PROMPT="%F{#5ff967}%~ %f%F{#5ff967}%B➜%b%f "