PATH_VIRTUALENVWRAPPER=/usr/bin/virtualenvwrapper_lazy.sh
if [ -f $PATH_VIRTUALENVWRAPPER ]
then
    source $PATH_VIRTUALENVWRAPPER
fi
export WORKON_HOME=$HOME/.virtualenvs

export PATH=$HOME/bin:$HOME/.virtualenvs/pygmentize/bin:$HOME/.cabal/bin/:$PATH
export BROWSER="google-chrome-stable"
export EDITOR=vim
export XAUTHORITY=$HOME/.Xauthority
export PATH="$PATH:$HOME/go/bin"
export GO111MODULES=on

source $HOME/.remapkbd

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/hm/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/hm/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/hm/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/hm/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
