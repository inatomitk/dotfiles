#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)

for f in * .[^\.]*; do
  [ "$f" = ".git" ] && continue
  [ "$f" = ".DS_Store" ] && continue
  [ "$f" = "install.sh" ] && continue
  [ "$f" = ".config" ] && continue

  ln -snfv "$SCRIPT_DIR"/"$f" "$HOME"/"$f"
done

if [ ! -e $HOME/.config ]; then mkdir $HOME/.config; fi
for f in .config/*; do
  ln -snfv "$SCRIPT_DIR"/"$f" "$HOME"/"$f"
done
