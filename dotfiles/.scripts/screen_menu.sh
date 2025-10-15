items="Extends\nExternal\nMirror"
output=$(echo -e $items | walker --dmenu)

extends_string="include ~/.config/kanshi/extends"
mirror_string="include ~/.config/kanshi/mirror"
external_string="include ~/.config/kanshi/extends"

if [[ "$output" == "Extends" ]]; then
  echo $extends_string > ~/.config/kanshi/switch
elif [[ "$output" == "External" ]]; then
  echo $external_string > ~/.config/kanshi/switch
elif [[ "$output" == "Mirror" ]]; then
  echo $mirror_string > ~/.config/kanshi/switch
else
  echo "Invalid command"
fi
