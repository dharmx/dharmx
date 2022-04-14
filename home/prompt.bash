PS1=""
PS2='' # multiline continuation
PS3='' # select

precmd() {
  RPROMPT="$(git-diff)"
}
