# Adapted from
# https://github.com/blaenk/dots/blob/master/zsh/zsh/prompt.zsh
# https://github.com/Tarrasch/pure/blob/master/pure.plugin.zsh

setopt prompt_subst

# Note to preserve my own and others' sanity
# git:
# %b => current branch
# %a => current action (rebase/merge)
# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)

export VIRTUAL_ENV_DISABLE_PROMPT=1
export PROMPT_CMD_MAX_EXEC_TIME=5

# display mode-aware arrow
function p_arrow {
    if [[ $KEYMAP = "vicmd" ]]; then
        local arrow_color="magenta"
    else
        local arrow_color="cyan"
    fi
    echo "%F{${arrow_color}}»%f"
}

# display colored path
function p_colored_path {
    local slash="%F{cyan}/%f"
    echo "${${PWD/#$HOME/~}//\//$slash}"
}

# display git info
function p_vcs {
    vcs_info
    echo $vcs_info_msg_0_
}

# environments:
#  - ssh
#  - virtualenv
#  - cabal sandbox

function p_envs {
    # check for cabal sandbox in parent directories, recursively
    local cabal
    #cabal=( (../)#cabal.sandbox.config(N) )

    local envs
    [[ -n $SSH_CLIENT ]]  && envs+="R"
    #(( $#cabal ))         && envs+="H"
    [[ -n $VIRTUAL_ENV ]] && envs+="P"

    [[ -n $envs ]] && echo " %F{green}[%f$envs%F{green}]%f"
}

# turn seconds into human readable time
# 165392 => 1d 21h 56m 32s
prompt_human_time() {
    local tmp=$1
    local days=$(( tmp / 60 / 60 / 24 ))
    local hours=$(( tmp / 60 / 60 % 24 ))
    local minutes=$(( tmp / 60 % 60 ))
    local seconds=$(( tmp % 60 ))
    (( $days > 0 )) && echo -n "${days}d "
    (( $hours > 0 )) && echo -n "${hours}h "
    (( $minutes > 0 )) && echo -n "${minutes}m "
    echo "${seconds}s"
}

# display the exec time of the last command if set threshold was exceeded
prompt_cmd_exec_time() {
    local stop=$SECONDS
    local start=${timer:-$stop}
    integer elapsed=$stop-$start
    (($elapsed > ${PROMPT_CMD_MAX_EXEC_TIME})) && prompt_human_time $elapsed
}

prompt_calc_cmd_exec_time() {
    timer=${timer:-$SECONDS}
}

prompt_add_cmd_exec_time_to_rprompt() {
    export RPROMPT="%"
    if [ $timer ]; then
        export RPROMPT="%F{cyan}`prompt_cmd_exec_time` %{$reset_color%}"
        unset timer
    fi
}

prompt_dynamic_window_title () {
    if test "$SSH_CONNECTION" != ''; then
        local title_username="%n@%M | "
    else
        local title_username=""
    fi

    # show the full path in the title
    case $TERM in
        xterm*)
            print -Pn '\e]2;${title_username}%~\a'
            ;;
    esac
}

prompt_setup() {
    add-zsh-hook precmd prompt_dynamic_window_title
    add-zsh-hook precmd prompt_add_cmd_exec_time_to_rprompt
    add-zsh-hook preexec prompt_calc_cmd_exec_time

    PROMPT='
%(?.%F{blue}.%F{red})λ%f $(p_colored_path)$(p_envs)$(p_vcs)
$(p_arrow) '

}

prompt_setup "$@"
