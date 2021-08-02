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
    alias docker-rbu='docker-compose rm -f && docker-compose build && docker-compose up'
fi

if command_exists docker; then
    # Kill all running containers.
    alias dockerkillall='docker kill $(docker ps -q)'

    # Delete all stopped containers.
    alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'

    # Delete all untagged images.
    alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'

    # Delete all untagged volumes
    alias dockercleanv='printf "\n>>> Deleting untagged volumes\n\n" && docker volume ls -qf dangling=true | xargs -r docker volume rm'

    # Delete all stopped containers and untagged images.
    alias dockerclean='dockercleanc || true && dockercleani || true && dockercleanv'
fi

if command_exists ffmpeg; then
    ytconvert() {
        ffmpeg -i "$1" -c:v libx264 -crf 18 -preset slow -pix_fmt yuv420p -c:a copy "$2.mkv"
    }
fi

if command_exists xsel; then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
fi

alias catcsv='awk "(NR == 1) || (FNR > 1)"'
