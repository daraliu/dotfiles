alias ":q"="exit"

alias ls="ls -lh --color=auto"

# fixes weird problem in tmux and ssh with zsh-syntax-highlighting
alias sudo='sudo '

# prompt if deleting more than 3 files
alias rm='rm -I'

command_exists() {
  (( $+commands[$1]))
}

# if command_exists git; then
#   alias git='noglob git'
#   alias g='git'
# fi

if command_exists vim; then
  # update vundle
  alias vimup='vim +PluginInstall! +qall'
fi

if command_exists emacs; then
  alias ec="emacsclient -nc"
fi

if command_exists docker-compose; then
    alias docker-rbu='docker-compose rm --all -f && docker-compose build && docker-compose up'
fi
