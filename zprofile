[[ -f ~/.profile ]] && . ~/.profile
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

# Created by `pipx` on 2024-06-10 16:09:09
export PATH="$PATH:/home/hm/.local/bin"
