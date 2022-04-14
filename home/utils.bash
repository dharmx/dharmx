git-diff() {
  if git status 2>&- 1> /dev/null; then
      branch="$(git -P branch | awk '{ print $2 }')"
      if [ "$(git -P diff)" ]; then
          print "%K{0}%B $branch %F{0}%K{5} ± %k%f%b"
      else
          print "%K{0}%B $branch %F{0}%K{2} %k%f%b"
      fi
      exit 0
  else
      exit 1
  fi
}
