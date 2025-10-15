items="Shutdown\nReboot\nLock\nSleep"
output=$(echo -e $items | walker --dmenu)

if [[ "$output" == "Shutdown" ]]; then
  shutdown now
elif [[ "$output" == "Reboot" ]]; then
  reboot
elif [[ "$output" == "Lock" ]]; then
  gtklock -d
elif [[ "$output" == "Sleep" ]]; then
  gtklock -d & sleep 1 && systemctl sleep
else
  echo "Invalid command"
fi
