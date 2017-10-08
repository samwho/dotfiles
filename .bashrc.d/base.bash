# Make colours work properly
[ -z "$TMUX" ] && export TERM=xterm-256color

# Checks for the existence of yarn and adds its global binary path to the PATH
# if it exists.
command -v yarn &> /dev/null
if [ $? == 0 ]
then
    export PATH="`yarn global bin`:$PATH"
fi

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

