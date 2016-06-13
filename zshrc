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
alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

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

source ~/.zsh/antigen-hs/init.zsh

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
# alias ls="ls -h --color=auto"

export TERM=xterm-256color

# dynamic terminal window title
case $TERM in
    xterm*)
        precmd () { print -Pn "\e]2;%n@%M | %~\a" }
        ;;
esac

# strict control over source order
sources=(
    #'hub'
    'path'
    #'rbenv'
    #'chruby'
    #'npm'
    'vcsinfo'
    'prompt'
    'completions'
    'zle'
    #'functions'
    #'alias'
    #'linux'
    #'osx'
    #'gtags'
    #'gnome-keyring'
    #'fzf'
    'highlight'
)

alias docker-compose-restart='docker-compose rm --all -f && docker-compose build && docker-compose up'

for src in $sources; do
    source $DOTSPATH/zsh/$src.zsh
done

### run after adding more plugins
rm -f ~/.zcompdump; compinit
source ~/.zsh/antigen-hs/init.zsh
