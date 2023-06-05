function _____smooth_fzf() {
  local fname
  pushd "$HOME/Dotfiles/dots.sh"
  fname="$(fzf)"
  if [[ "$fname" ]]; then
    $EDITOR "$fname"
  fi
  popd
}

function _____sudo_replace_buffer() {
  local old=$1 new=$2 space=${2:+ }

  # if the cursor is positioned in the $old part of the text, make
  # the substitution and leave the cursor after the $new text
  if [[ $CURSOR -le ${#old} ]]; then
    BUFFER="${new}${space}${BUFFER#$old }"
    CURSOR=${#new}
  # otherwise just replace $old with $new in the text before the cursor
  else
    LBUFFER="${new}${space}${LBUFFER#$old }"
  fi
}

function _____sudo_command_line() {
  # If line is empty, get the last run command from history
  [[ -z $BUFFER ]] && LBUFFER="$(fc -ln -1)"

  # Save beginning space
  local WHITESPACE=""
  if [[ ${LBUFFER:0:1} = " " ]]; then
    WHITESPACE=" "
    LBUFFER="${LBUFFER:1}"
  fi

  {
    # If $SUDO_EDITOR or $VISUAL are defined, then use that as $EDITOR
    # Else use the default $EDITOR
    local EDITOR=${SUDO_EDITOR:-${VISUAL:-$EDITOR}}

    # If $EDITOR is not set, just toggle the sudo prefix on and off
    if [[ -z "$EDITOR" ]]; then
      case "$BUFFER" in
        sudo\ -e\ *) _____sudo_replace_buffer "sudo -e" "" ;;
        sudo\ *) _____sudo_replace_buffer "sudo" "" ;;
        *) LBUFFER="sudo $LBUFFER" ;;
      esac
      return
    fi

    # Check if the typed command is really an alias to $EDITOR

    # Get the first part of the typed command
    local cmd="${${(Az)BUFFER}[1]}"
    # Get the first part of the alias of the same name as $cmd, or $cmd if no alias matches
    local realcmd="${${(Az)aliases[$cmd]}[1]:-$cmd}"
    # Get the first part of the $EDITOR command ($EDITOR may have arguments after it)
    local editorcmd="${${(Az)EDITOR}[1]}"

    # Note: ${var:c} makes a $PATH search and expands $var to the full path
    # The if condition is met when:
    # - $realcmd is '$EDITOR'
    # - $realcmd is "cmd" and $EDITOR is "cmd"
    # - $realcmd is "cmd" and $EDITOR is "cmd --with --arguments"
    # - $realcmd is "/path/to/cmd" and $EDITOR is "cmd"
    # - $realcmd is "/path/to/cmd" and $EDITOR is "/path/to/cmd"
    # or
    # - $realcmd is "cmd" and $EDITOR is "cmd"
    # - $realcmd is "cmd" and $EDITOR is "/path/to/cmd"
    # or
    # - $realcmd is "cmd" and $EDITOR is /alternative/path/to/cmd that appears in $PATH
    if [[ "$realcmd" = (\$EDITOR|$editorcmd|${editorcmd:c}) \
      || "${realcmd:c}" = ($editorcmd|${editorcmd:c}) ]] \
      || builtin which -a "$realcmd" | command grep -Fx -q "$editorcmd"; then
      _____sudo_replace_buffer "$cmd" "sudo -e"
      return
    fi

    # Check for editor commands in the typed command and replace accordingly
    case "$BUFFER" in
      $editorcmd\ *) _____sudo_replace_buffer "$editorcmd" "sudo -e" ;;
      \$EDITOR\ *) _____sudo_replace_buffer '$EDITOR' "sudo -e" ;;
      sudo\ -e\ *) _____sudo_replace_buffer "sudo -e" "$EDITOR" ;;
      sudo\ *) _____sudo_replace_buffer "sudo" "" ;;
      *) LBUFFER="sudo $LBUFFER" ;;
    esac
  } always {
    # Preserve beginning space
    LBUFFER="${WHITESPACE}${LBUFFER}"

    # Redisplay edit buffer (compatibility with zsh-syntax-highlighting)
    zle redisplay
  }
}

function _____vi_search_fix() {
  zle vi-cmd-mode
  zle .vi-history-search-backward
}

function _____default_greeter() {
  c1="\033[1;30m"
  c2="\033[1;31m"
  c3="\033[1;32m"
  c4="\033[1;33m"
  c5="\033[1;34m"
  c6="\033[1;35m"
  c7="\033[1;36m"
  c8="\033[1;37m"
  reset="\033[1;0m"
  printf "\n $c1▇▇ $c2▇▇ $c3▇▇ $c4▇▇ $c5▇▇ $c6▇▇ $c7▇▇ $c8▇▇ $reset\n\n"
}

function _____toggle_prompt() {
  case "$1" in
    right) p10k display '*/right'=hide,show ;;
    left) p10k display '*/left'=hide,show ;;
  esac
}

function _____toggle_right_prompt() {
  _____toggle_prompt right
}

function _____toggle_left_prompt() {
  _____toggle_prompt left
}

function _____top_used_commands() {
  history \
    | awk '{
      CMD[$2]++;
      count++;
    } END {
    for (a in CMD)
      print CMD[a] " " CMD[a] / count * 100 "% " a;
    }' \
    | grep -v "./" \
    | column -c3 -s " " -t \
    | sort -nr \
    | nl \
    |  head -n 21
}

function _____color_list() {
    for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

function _____ccat() {
  if $2
  then
      pygmentize -g $1 | cat
  else
      pygmentize -g $2 | cat $1
  fi
}

function _____cless() {
  pygmentize -g $1 | less
}

function _____cmore() {
  pygmentize -g $1 | more
}

function _____pacopt() {
  if [[ "$@" == "" ]]; then
    echo "Enter at least one package name!"
  else
    sudo pacman -S --asdeps --needed $(pacman -Si $1 | sed -n '/^Opt/,/^Conf/p' | sed '$d' | sed 's/^Opt.*://g' | sed 's/^\s*//g' | tr '\n' ' ')
  fi
}

function _____compress_pdf_gray() {
  [ $(command -v gs) ] \
    && gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$2.pdf" "$1.pdf" \
    || echo 'Ghostscript - gs needs to be installed.'
}

function _____compress_pdf() {
  local level="screen"
  [[ "$3" != "" ]] && level="$3"
  [ $(command -v gs) ] \
    && gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/"$level" -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$2.pdf" "$1.pdf" \
    || echo 'Ghostscript - gs needs to be installed.'
}

function _____redditdw() {
  local name="$(echo $1 | cut -d '/' -f 7)"
  local plus="$(echo $1 | cut -d'/' -f 8)"
  [ $(command -v ffmpeg) ] \
    && ffmpeg -i "$(
    wget -qO- "https://api.reddit.com/api/info/?id=t3_$name" \
      | jq -r .data.children[0].data.secure_media.reddit_video.dash_url \
    )" -c copy "$plus.mp4" \
    || echo 'ffmpeg needs to be installed.'
}

function _____bulkhn() {
  for i in *; do 
    pushd "$i" 
    for j in *; do 
      [ "${j:3}" = png ] && convert "$j" "${j::2}".jpg
    done
    rm -rf *.png
    convert *.jpg "$i".pdf
    popd
  done
  mv **/*.pdf .
}

function _____dw_tarball() {
    curl -Lk "https://api.github.com/repos/$1/$2/tarball" | tar zx
}

function _____stylua_fmt() {
    local current="$PWD"
    cd "$1"
    [ $(command -v stylua) ] \
      && stylua . \
      || echo 'stylua is not installed'
    cd "$current"
}

function _____webm_to_audio {
  find . -type f -iname "*.webm" -exec bash -c 'FILE="$1"; ffmpeg -i "${FILE}" -vn -ab 128k -ar 44100 -y "${FILE%.webm}.mp3";' _ '{}' \;
}

function _____mkv_to_mp4() {
  ffmpeg -i $1 -c copy "${1%.mkv}.mp4"
}

function _____mkv_to_audio {
  find . -type f -name "*.mkv" -exec bash -c 'FILE="$1"; ffmpeg -i "${FILE}" -vn $' \;
}

function _____mp4_to_audio() {
  find . -type f -name "*.mp4" -exec bash -c 'FILE="$1"; ffmpeg -i "${FILE}" -b:a 192K -vn "${FILE%.mp4}.mp3";' _ '{}' \;
}

function _____rsysd() { systemctl $1 daemon-reload; }

function _____base16img() {
  convert "$1" -depth 6 +dither -colors 16 -format %c histogram:info: | awk '{print $3}' | cut -c -7
}

function _____reload_gtk_theme() {
  theme=$(gsettings get org.gnome.desktop.interface gtk-theme)
  gsettings set org.gnome.desktop.interface gtk-theme ''
  sleep 1
  gsettings set org.gnome.desktop.interface gtk-theme $theme
}

function _____monv() {
  montage -shadow -background '#151A1F' -geometry +25+25 -tile 1x *.png montage.png
}

function _____monvns() {
  montage -background '#151A1F' -geometry +20+20 -tile 1x *.png montage.png
}

function _____monh() {
  pngs=(*.png)
  montage -shadow -background '#151A1F' -geometry +25+25 -tile ${#pngs}x *.png montage.png
}

function _____monhns() {
  pngs=(*.png)
  montage -background '#151A1F' -geometry +25+25 -tile ${#pngs}x *.png montage.png
}

function _____adbwifi() {
  command -v adb &>/dev/null || return
  adb devices
  echo -n "SERIAL: "
  read serial
  adb -s $serial tcpip 5555
  echo -n "IP: "
  read ip
  adb connect $ip:5555
}

function _____p10kstate() {
  local reply
  p10k display -a '*'
  printf '%-32s = %q\n' ${(@kv)reply} | sort
}

function _____ewwpkill() {
  eww windows | grep '\*' || pgrep --full './src/shell/playerctl.py' | awk '{print $1}' | xargs kill
}

function _____genscheme() {
  if [[ "$3" == "array" ]]; then
    echo "[${$(convert "$1" -depth 6 +dither -colors $2 -format %c histogram:info: | awk '{printf("\"%s\",",$3)}')::-1}]"
  else
    echo "{${$(convert "$1" -depth 6 +dither -colors $2 -format %c histogram:info: | awk '{printf("\"base%02d\":\"%s\",",i++,$3)}')::-1}}"
  fi
}

function _____falias() {
  for fun in ${(ok)functions[(I)[_][_][_][_][_]*]}; do
    type -f $fun
  done
}

function _____ytframe() {
  local screenshot_time="$1"
  local youtube_url="$2"
  local output_file="$3"
  ffmpeg -ss "$screenshot_time" -i $(yt-dlp -f 22 --get-url "$youtube_url") -vframes 1 -q:v 2 "$output_file"
}

function _____wall() {
  convert "$3" -resize "$2" -gravity center -background "$1" -extent 1920x1080 "$4"
}

function _____expire-network() {
  echo -n 'EXP: '
  curl --silent 'http://10.254.254.79/0/up/' | fq --decode html --raw-output '.html.body.div[1].div[0].table[1].tbody.tr.td[2].div.table.tbody.tr[4].td[1]["#text"]'
  echo -n 'NOW: '
  date +'%d.%m.%Y'
}
