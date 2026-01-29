items=$(systemctl list-unit-files --type=service --no-pager --all --state=disabled | tail -n +2 | head -n -2 | awk '{print $1}')
output=$(echo -e "$items" | walker --dmenu)
passwd=$(zenity --password --title="Authentication for TLP")

echo $passwd | sudo -S systemctl start $output
