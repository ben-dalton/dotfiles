# 1 line prompt
# PROMPT='%{$fg[green]%}λ %{$fg[cyan]%}%c $(git_prompt_info)$(hg_prompt_info)%{$reset_color%}'

# 2 line prompt
PROMPT='%{$fg[green]%}╭─ %{$fg[cyan]%}%~ $(git_prompt_info)$(hg_prompt_info)
%{$fg[green]%}╰─ λ %{$reset_color%}'

RPROMPT='%w%t'

branch_glyph=$'\Ue0a0' # 

clean_prompt="$emoji[sparkles]"
danger_prompt="$emoji[man_dancing]"
warn_prompt="$emoji[collision]"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}\Ue0a0 %{$reset_color%}%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}${clean_prompt}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}${warn_prompt}"


(( ${+emoji} )) || {
  echo "error: Ben's theme requires the emoji plugin" >&2
  return 1
}

