#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)

for f in * .[^\.]*; do
  [ "$f" = ".git" ] && continue
  [ "$f" = ".DS_Store" ] && continue
  [ "$f" = "install.sh" ] && continue

  ln -snfv "$SCRIPT_DIR"/"$f" "$HOME"/"$f"
done
