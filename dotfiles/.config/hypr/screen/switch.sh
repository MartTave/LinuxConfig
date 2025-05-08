if [ "$SCREEN_MIRROR" == "0" ];
then
    echo "source = ./mirror.conf" > screen.conf;
    export SCREEN_MIRROR=1;
else
    echo "source = ./extends.conf" > screen.conf;
    export SCREEN_MIRROR=0;
fi
