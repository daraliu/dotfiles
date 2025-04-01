PATH_VIRTUALENVWRAPPER=/usr/bin/virtualenvwrapper_lazy.sh
if [ -f $PATH_VIRTUALENVWRAPPER ]
then
    source $PATH_VIRTUALENVWRAPPER
fi
export WORKON_HOME=$HOME/.virtualenvs

export PATH="$HOME/bin:$HOME/.virtualenvs/pygmentize/bin:$HOME/.cabal/bin/:$PATH"
export BROWSER="google-chrome-stable"
export EDITOR=vim
export XAUTHORITY=$HOME/.Xauthority
export PATH="$PATH:$HOME/go/bin"
export GO111MODULES=on

source $HOME/.remapkbd

if [ -d $HOME/.local/share/JetBrains/Toolbox/scripts ]
then
    export PATH="$HOME/.local/share/JetBrains/Toolbox/scripts:$PATH"
fi

. "$HOME/.cargo/env"
