if command -v "code" >/dev/null
then
  export EDITOR="code"
  export GIT_EDITOR="$EDITOR -w"
elif command -v "vim" >/dev/null
then
  export EDITOR="vim"
elif command -v "vi" >/dev/null
then
  export EDITOR="vi"
fi
