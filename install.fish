#!/usr/bin/env fish

function make_link -a path out_path
  if not test -L $out_path
    ln -s $PWD/$path $out_path
  end
end

# make symbolic link
make_link fish/config.fish ~/.config/fish/config.fish
make_link tmux/tmux.conf ~/.tmux.conf

mkdir -p ~/.tmux/themes
make_link tmux/tomorrow_fork.tmux ~/.tmux/themes/tomorrow_fork.tmux

mkdir -p ~/.tmux/modules
make_link tmux/go.fish ~/.tmux/modules/go.fish
make_link tmux/gitmux.conf ~/.gitmux.conf
