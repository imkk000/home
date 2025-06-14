if status --is-interactive
  if not set -q TMUX
    tmux new-session
  end
  set SESSION_WINDOW (tmux display-message -p '#S:#I')
end

fish_hybrid_key_bindings

for file in (/bin/ls ~/.config/fish/after/*.fish)
  source $file
end

source ~/.config/fish/private_config.fish
