# If running trom tty1 start sway
switch (tty)
case /dev/tty1
    export XKB_DEFAULT_OPTIONS=ctrl:nocaps,lv3:ralt_switch_multikey
    sway
    exit 0
end
