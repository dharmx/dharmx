export SUDO_PROMPT="pass: "
export TERMINAL="st"
export BROWSER="qutebrowser"
export VISUAL="nvim"
export EDITOR="nvim"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_DATA_DIRS="/usr/local/share:/usr/share:/var/lib/flatpak/exports/share:$XDG_DATA_HOME/flatpak/exports/share"

export XDG_RUNTIME_DIR="/run/user/$(id -u)"

export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_TEMPLATES_DIR="$HOME/Templates"
export XDG_PUBLICSHARE_DIR="$HOME/Public"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_VIDEOS_DIR="$HOME/Videos"

export PATH="$PATH:$XDG_DATA_HOME/gem/ruby/3.0.0/bin:$:$XDG_DATA_HOME/../bin"

## Comment this out if you want normal manpages
export MANPAGER='nvim +Man! +"set nocul" +"set noshowcmd" +"set noruler" +"set noshowmode" +"set laststatus=0" +"set showtabline=0" +"set nonumber"'
if [ ! $(echo $MANPAGER | awk '{print $1}') = nvim ]; then
  export MANPAGER="less -s +M +Gg"
  export LESS="--RAW-CONTROL-CHARS"

  export LESS_TERMCAP_mb=$'\e[1;32m'
  export LESS_TERMCAP_md=$'\e[1;32m'
  export LESS_TERMCAP_me=$'\e[0m'
  export LESS_TERMCAP_se=$'\e[0m'
  export LESS_TERMCAP_so=$'\e[01;33m'
  export LESS_TERMCAP_ue=$'\e[0m'
  export LESS_TERMCAP_us=$'\e[1;4;31m'
fi

export AWT_TOOLKIT="MToolkit"
export _JAVA_AWT_WM_NONREPARENTING=1
export JDK_JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Djdk.gtk.version=2.2 -Dsun.java2d.opengl=true'
export RANGER_DEVICONS_SEPARATOR=" "
export SXHKD_SHELL="zsh"

if [ -d "$HOME/.spicetify" ]; then
  export SPICETIFY_INSTALL="$HOME/.spicetify"
  export PATH="$PATH:$HOME/.spicetify"
fi

if [ -d "$XDG_CONFIG_HOME/adb-fastboot/platform-tools" ]; then
 export PATH="$PATH:$XDG_CONFIG_HOME/adb-fastboot/platform-tools"
fi

# vim:ft=zsh:nowrap
