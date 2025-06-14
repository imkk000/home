#!/usr/bin/env fish

source ~/.config/fish/functions/make_link.fish
source ~/.config/fish/functions/make_dir_link.fish

mkdir -p ~/.config/fish/conf.d
make_link fish/config.fish ~/.config/fish/config.fish
make_dir_link fish/after ~/.config/fish/after
for file in (/bin/ls fish/before/*.fish)
    make_link $file ~/.config/fish/conf.d/(path basename $file)
end

mkdir -p ~/.tmux/themes ~/.tmux/modules
make_link tmux/tmux.conf ~/.tmux.conf
make_link tmux/gitmux.conf ~/.gitmux.conf
make_link tmux/tomorrow_fork.tmux ~/.tmux/themes/tomorrow_fork.tmux
make_link tmux/tmux_go.fish ~/.tmux/modules/go.fish

mkdir -p ~/.vscode/extensions
make_dir_link vscode/tomorrow-fork ~/.vscode/extensions/tomorrow-fork

mkdir -p $CONFIG_DIR/Code/User
make_link vscode/settings.json $CONFIG_DIR/Code/User/settings.json
