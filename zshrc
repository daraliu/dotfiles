if [[ $TERM == xterm-termite ]]; then
    . /etc/profile.d/vte.sh
    __vte_osc7
fi

# determine path to dots dir
DOTSPATH="$(cd $(dirname $(readlink -f ${(%):-%N})); pwd)"

autoload -U compinit bashcompinit promptinit colors select-word-style
select-word-style bash
compinit -i
bashcompinit
promptinit
colors

source $HOME/.profile
source /etc/profile

# History settings
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt INC_APPEND_HISTORY
setopt MAILWARN
setopt NOTIFY
setopt SHARE_HISTORY
setopt INTERACTIVE_COMMENTS

# from oh-my-zsh vi-mode pending pull request pending PR
# https://github.com/robbyrussell/oh-my-zsh/pull/4225
# allow ctrl-r for searching history backward while in insert mode
bindkey '^r' history-incremental-search-backward
# allow ctrl-a to go to beginning of line while in insert mode
bindkey '^a' beginning-of-line
# allow ctrl-e to go to end of line while in insert mode
bindkey '^e' end-of-line

# dircolors
# eval $(dircolors ~/.dircolors)

export TERM=xterm-256color

# switched to antidote
source /usr/share/zsh-antidote/antidote.zsh
antidote load
# source ~/.zsh_plugins.sh

# strict control over source order
sources=(
    'vcsinfo'
    'prompt'
    'completions'
    'zle'
    'alias'
    'highlight'
)

for src in $sources; do
    source ${DOTSPATH}/zsh/${src}.zsh
done

### run after adding more plugins
rm -f ~/.zcompdump; compinit

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/hm/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/hm/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/home/hm/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/home/hm/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/hm/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/home/hm/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<


# Created by `pipx` on 2024-06-10 16:09:09
export PATH="$PATH:/home/hm/.local/bin"
