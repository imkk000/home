#!/usr/bin/env fish

function make_link -a path out_path
  if not test -L $out_path
    ln -s $PWD/$path $out_path
  end
end

function make_dir_link -a path out_path
  if test -L $out_path
    set_color yellow
    echo "$out_path already exists (symlinked)"
    set_color normal
    return 0
  end
  if test -d $out_path
    echo -e "\033[31m$out_path already exists (directory)\033[23m"
    return 1
  end
  ln -s $PWD/$path $out_path
end

# make symbolic link
make_link fish/config.fish ~/.config/fish/config.fish
make_link tmux/tmux.conf ~/.tmux.conf

mkdir -p ~/.tmux/themes
make_link tmux/tomorrow_fork.tmux ~/.tmux/themes/tomorrow_fork.tmux

mkdir -p ~/.tmux/modules
make_link tmux/go.fish ~/.tmux/modules/go.fish
make_link tmux/gitmux.conf ~/.gitmux.conf

mkdir -p ~/.vscode/extensions/themes
make_dir_link vscode/tomorrow-fork ~/.vscode/extensions/tomorrow-fork