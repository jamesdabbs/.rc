if [[ -z "$SSH_CLIENT" ]]; then
  loc="%{$fg_bold[blue]%}%~%{$reset_color%}"
else
  loc="%{$fg_bold[yellow]%}%~%{$reset_color%}"
fi

function docker_machine_name {
  [[ -n "$DOCKER_MACHINE_NAME" ]] && echo "%{$fg_bold[grey]%}($DOCKER_MACHINE_NAME) "
}

# Other symbols I might want to use: ∴ ⊗ ⊩
PROMPT=' $(docker_machine_name)${loc} %{$fg[green]%}%(?..%{$fg_bold[red]%})⊩%{$reset_color%} '


# Right prompt w/ Git info - borrowed heavily from `gozilla` theme
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

RPROMPT='$(git_prompt_status)%{$reset_color%}  %{$fg_bold[blue]%}$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ⚡ "
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✗"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[grey]%} ✱"

ZSH_THEME_GIT_PROMPT_STASHED="%{$fg_bold[red]%} ☁ "
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[yellow]%} ↑"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[yellow]%} ↓"
ZSH_THEME_GIT_PROMPT_DIVERGED="%{$fg[yellow]%} ↕"
