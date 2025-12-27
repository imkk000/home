#!/usr/bin/env fish

source ~/.config/fish/functions/make_link.fish
source ~/.config/fish/functions/make_dir_link.fish

mkdir -p ~/.config/fish/conf.d ~/.config/fish/themes
make_link fish/config.fish ~/.config/fish/config.fish
make_dir_link fish/after ~/.config/fish/after
for file in (/bin/ls fish/before/*.fish)
    make_link $file ~/.config/fish/conf.d/(path basename $file)
end

mkdir -p ~/.tmux
make_link tmux/tmux.conf ~/.tmux.conf
make_link tmux/gitmux.conf ~/.gitmux.conf

mkdir -p ~/.vscode/extensions

mkdir -p $CONFIG_DIR/Code\ -\ OSS/User
make_link vscode/settings.json $CONFIG_DIR/Code\ -\ OSS/User/settings.json

make_dir_link nvim $CONFIG_DIR/nvim
