fish_hybrid_key_bindings

for file in (/bin/ls ~/.config/fish/after/*.fish)
  source $file
end

source ~/.config/fish/private_config.fish
