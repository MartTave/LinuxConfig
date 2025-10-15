items="Battery saver\nPerformance\n"
output=$(echo -e $items | walker --dmenu)

passwd=$(zenity --password --title="Authentication for TLP")

if [[ "$output" == "Battery saver" ]]; then
    echo $passwd | sudo -S tlp bat
elif [[ "$output" == "Performance" ]]; then
    echo $passwd | sudo -S tlp ac
else
  echo "Invalid command"
fi
