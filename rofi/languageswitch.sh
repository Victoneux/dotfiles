rofi_command="rofi -theme powermenu.rasi"

# Options
english="EN"
german="DE"

confirm_exit() {
    rofi -dmenu\
    -i\
    -no-fixed-num-lines\
    -theme 'confirm.rasi'
}

# Variable passed to rofi
options="$english\n$german"

chosen="$(echo -e "$options" | $rofi_command -p "Language Select" -dmenu -selected-row 0)"
case $chosen in
    $english)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
			setxkbmap -layout us
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
        else
			msg
        fi
        ;;
    $german)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
			setxkbmap -layout de
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
        else
			msg
        fi
        ;;
esac
