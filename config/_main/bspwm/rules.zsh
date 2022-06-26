# removed default rules
bspc rule --remove *:*

alias rule='bspc rule --add'

# Program settings
rule glava state=floating manage=off layer=below
rule mpv state=floating center=on
rule screenkey manage=off
rule spotify state=pseudo_tiled
rule zathura state=floating
rule feh state=floating center=on rectangle=1080x784+416+145
rule jgmenu manage=off state=floating
rule Pavucontrol state=floating center=on
rule Peek:peek state=floating center=on rectangle=1080x784+416+145
rule Gnome-disks:gnome-disks state=floating center=on
rule blueman-manager state=floating state=floating center=on
rule Plank manage=on border=off locked=on focus=off follow=off layer=above
rule blueman-adapters state=floating state=floating center=on
rule Rofi border=off manage=off layer=above
rule nm-connection-editor='^1' state=floating 
rule Dconf-editor state=floating center=on
rule Git-gui state=floating center=on
rule Org.gnome.Nautilus state=floating center=on
rule Nemo state=floating center=on
rule Gimp-2.10:gimp-2.10 border=off
rule Shotwell state=floating center=on
rule firefox:Places state=floating center=on
rule stalonetray manage=off locked=on border=off layer=above focus=off state=floating
rule Plank manage=off layer=above focus=off
rule Spotify state=floating center=on rectangle=1080x784+416+145
rule Seahorse state=floating center=on

unalias rule

# vim:ft=zsh
