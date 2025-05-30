#!/usr/bin/env fish

function make_link -a path out_path
  if not test -L $out_path
    ln -s $PWD/$path $out_path
  end
end

# make symbolic link
make_link git/gitignore ~/.gitignore
make_link fish/config.fish ~/.config/fish/config.fish
make_link tmux/tmux.conf ~/.tmux.conf
