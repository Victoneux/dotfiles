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
        setxkbmap -layout us
        ;;
    $german)
		setxkbmap -layout de
        ;;
esac
