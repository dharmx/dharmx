# removed default rules
bspc rule --remove *:*

alias rule='bspc rule --add'

# Program settings
rule glava state=floating manage=off layer=below
rule mpv state=floating center=on
rule screenkey manage=off
rule spotify state=pseudo_tiled
rule zathura state=floating
rule feh state=floating center=on
rule jgmenu manage=off floating=on
rule Pavucontrol state=floating center=on
rule Peek floating=on center=on
rule blueman-manager state=floating floating=on center=on
rule blueman-adapters state=floating floating=on center=on
rule Rofi border=off manage=off layer=above
rule nm-connection-editor='^1' state=floating 
rule dconf-editor floating=on center=on
rule Git-gui floating=on center=on
rule Org.gnome.Nautilus floating=on center=on
rule Peek floating=on center=on

rule Gimp-2.10:gimp-2.10 border=off
rule firefox:Places state=floating center=on

unalias rule

# vim:ft=zsh
