rofi_command="rofi -theme powermenu.rasi"

# Options
shutdown=""
reboot=""
quit=""

confirm_exit() {
    rofi -dmenu\
    -i\
    -no-fixed-num-lines\
    -theme 'confirm.rasi'
}

# Variable passed to rofi
options="$shutdown\n$reboot\n$quit"

chosen="$(echo -e "$options" | $rofi_command -p "Power Menu" -dmenu -selected-row 1)"
case $chosen in
    $shutdown)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
			systemctl poweroff
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
        else
			msg
        fi
        ;;
    $reboot)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
			systemctl reboot
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
        else
			msg
        fi
        ;;
    $quit)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
			pkill awesome
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
        else
			msg
        fi
        ;;
esac
