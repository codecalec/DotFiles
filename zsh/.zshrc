# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000
setopt autocd notify
bindkey -v
# End of lines configured by zsh-newuser-install

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Faster mode switching
export KEYTIMEOUT=1

# Backwards search
bindkey '^R' history-incremental-search-backward

# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward


#Functions
over_ssh() {
    if [ -n "${SSH_CLIENT}" ]; then
        return 0
    else
        return 1
    fi
}

# Not all servers have terminfo for rxvt-256color. :<
if [ "${TERM}" = 'rxvt-256color' ] && ! [ -f '/usr/share/terminfo/r/rxvt-256color' ] && ! [ -f '/lib/terminfo/r/rxvt-256color' ] && ! [ -f "${HOME}/.terminfo/r/rxvt-256color" ]; then
    export TERM='rxvt-unicode'
fi

autoload -U colors && colors

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# Colour
alias ls='ls --color=auto'

# Prompt

autoload -U promptinit

# Updates editor information when the keymap changes.
function zle-keymap-select() {
  zle reset-prompt
}

zle -N zle-keymap-select

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/[% VI]%}/(main|viins)/}"
}

if over_ssh && [ -z "${TMUX}" ]; then
    prompt_is_ssh='%F{blue}[%F{green}SSH%F{blue}]'
elif over_ssh; then
    prompt_is_ssh='%F{blue}[%F{253}SSH%F{blue}]'
else
    unset prompt_is_ssh
fi

case $USER in
    root)
        PROMPT='%B%F{cyan}%m%k %(?..%F{blue}[%F{253}%?%F{blue}] )${prompt_is_ssh}%B%F{blue}%1~${git_prompt}%F{blue} %# %b%f%k'
    ;;

    *)
        PROMPT='%B%F{blue}%n%f@%F{green}%m%k $(vi_mode_prompt_info) %(?..%F{blue}[%F{253}%?%F{blue}] )${prompt_is_ssh}%B%F{cyan}%1~${git_prompt}%F{cyan} %# %b%f%k'

    ;;
esac

# Git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git
