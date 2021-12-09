function ccat() {
  if $2
  then
      pygmentize -g $1 | cat
  else
      pygmentize -g $2 | cat $1
  fi
}

function cless() {
  pygmentize -g $1 | less
}

function cmore() {
  pygmentize -g $1 | more
}
