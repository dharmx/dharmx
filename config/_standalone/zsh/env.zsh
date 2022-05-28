typeset -gx TERMINAL="st"
typeset -gx BROWSER="qutebrowser"
typeset -gx VISUAL="nvim"
typeset -gx EDITOR="nvim"
typeset -gx MANPAGER="less -s -M +Gg"
typeset -gx LESS="--RAW-CONTROL-CHARS"

typeset -gx XDG_CONFIG_HOME="$HOME/.config"
typeset -gx XDG_CACHE_HOME="$HOME/.cache"

typeset -gx XDG_DATA_HOME="$HOME/.local/share"
typeset -gx XDG_STATE_HOME="$HOME/.local/state"
typeset -gx XDG_CONFIG_DIRS="/etc/xdg"
typeset -gx XDG_DATA_DIRS="/usr/local/share:/usr/share:/var/lib/flatpak/exports/share:$XDG_DATA_HOME/flatpak/exports/share"

typeset -gx XDG_RUNTIME_DIR="/run/user/$(id -u)"

typeset -gx XDG_DESKTOP_DIR="$HOME/Desktop"
typeset -gx XDG_DOWNLOAD_DIR="$HOME/Downloads"
typeset -gx XDG_TEMPLATES_DIR="$HOME/Templates"
typeset -gx XDG_PUBLICSHARE_DIR="$HOME/Public"
typeset -gx XDG_DOCUMENTS_DIR="$HOME/Documents"
typeset -gx XDG_MUSIC_DIR="$HOME/Music"
typeset -gx XDG_PICTURES_DIR="$HOME/Pictures"
typeset -gx XDG_VIDEOS_DIR="$HOME/Videos"

typeset -gx PATH="$PATH:$XDG_DATA_HOME/gem/ruby/3.0.0/bin:$HOME/.local/bin"

typeset -gx LESS_TERMCAP_mb=$'\e[1;32m'
typeset -gx LESS_TERMCAP_md=$'\e[1;32m'
typeset -gx LESS_TERMCAP_me=$'\e[0m'
typeset -gx LESS_TERMCAP_se=$'\e[0m'
typeset -gx LESS_TERMCAP_so=$'\e[01;33m'
typeset -gx LESS_TERMCAP_ue=$'\e[0m'
typeset -gx LESS_TERMCAP_us=$'\e[1;4;31m'

typeset -gx AWT_TOOLKIT="MToolkit"
typeset -gx _JAVA_AWT_WM_NONREPARENTING=1
typeset -gx JDK_JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Djdk.gtk.version=2.2 -Dsun.java2d.opengl=true'
typeset -gx RANGER_DEVICONS_SEPARATOR=" "

if [ -d "$XDG_CONFIG_HOME/adb-fastboot/platform-tools" ]; then
 typeset -gx PATH="$PATH:$XDG_CONFIG_HOME/adb-fastboot/platform-tools"
fi

# vim:ft=zsh:nowrap
