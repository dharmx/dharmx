#ccat&cless&cmore
ccat (){
  if $2
  then
      pygmentize -g $1 | cat
  else
      pygmentize -g $2 | cat $1
  fi
}

cless(){
  pygmentize -g $1 | less
}

cmore(){
  pygmentize -g $1 | less
}
