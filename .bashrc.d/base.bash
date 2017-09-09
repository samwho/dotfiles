# Make colours work properly
[ -z "$TMUX" ] && export TERM=xterm-256color

export PATH=$HOME/.bin:$PATH

# Stolen/adapted from: https://unix.stackexchange.com/a/22215
findUp() {
    path=$(pwd)
    while [[ "$path" != "" && ! -e "$path/$1" ]]; do
        path=${path%/*}
    done

    if [ "$path" == "" ]
    then
        return 1
    fi

    echo "$path/$1"
}

