DEFAULT_SESSION=awesome


xrdb -merge ~/.Xresources
numlockx on
setxkbmap -layout us,ru,ua -variant ,winkeys,winkeys -option grp:alt_shift_toggle,grp:alt_shift_toggle_bidir,terminate:ctrl_alt_bksp,compose:ralt
xmodmap -e "keycode 108 = Alt_R"

case $1 in
    openbox)
	exec openbox-session
	;;

    qtile)
        exec qtile
        ;;

    awesome)
	AWESOME_LOG="/tmp/awesome.log"
	echo -e "\n\n\n\n\n\n" >> $AWESOME_LOG
	date >> $AWESOME_LOG
	exec awesome >> $AWESOME_LOG 2>&1
	;;

    *)
	exec $DEFAULT_SESSION
	;;
esac

