[[ -f /usr/bin/VBoxClient-all ]] && /usr/bin/VBoxClient-all
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
[[ -f ~/.fehbg ]] && ~/.fehbg
xrdb -load ~/.Xdefaults
exec i3
