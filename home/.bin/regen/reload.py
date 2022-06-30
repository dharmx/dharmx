from os import system

def relxresource() -> None:
    system('xrdb -I "$XDG_CONFIG_HOME/Xresources" "$XDG_CONFIG_HOME/Xresources/config.x"')


def relspices() -> None:
    system("spicetify apply")


def relbspwm() -> None:
    system("bspc wm -r &")
    system("xdo lower -N stalonetray")


def reldunst() -> None:
    system('killall dunst && dunst -conf $XDG_CONFIG_HOME/dunst/config.ini &')


def releww() -> None:
    system("eww reload")


def relpoly() -> None:
    pass


def relst() -> None:
    system("kill -USR1 $(pidof st)")


def relkitty() -> None:
    system("kill -USR1 $(pidof kitty)")


def reltym() -> None:
    system("kill -USR1 $(pidof tym)")


def relnvim() -> None:
    system("kill $(pidof nvim)")
    system("kill -USR1 $(pidof neovide)")

# vim:filetype=python
