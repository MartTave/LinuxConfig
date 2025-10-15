res=$(tlp-stat -m)

if [[ "$res" == battery* ]]; then
  echo ""
elif [[ "$res" == AC* ]]; then
  echo "󱐋"
else
  echo ""
fi
