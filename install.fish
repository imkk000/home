function make_link -a path out_path
  if not test -L $out_path
    ln -s $PWD/$path $out_path
  end
end

make_link git/gitconfig ~/.gitconfig
make_link git/gitignore ~/.gitignore
make_link fish/config.fish ~/.config/fish/config.fish
