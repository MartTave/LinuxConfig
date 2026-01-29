res=$(tlp-stat -m)

if [[ "$res" == power-saver/SAV ]]; then
  echo ""
elif [[ "$res" == balanced/BAT ]]; then
  echo ""
elif [[ "$res" == performance/AC ]]; then
  echo "󱐋"
else
  echo ""
fi
