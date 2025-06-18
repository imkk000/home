zoxide init fish | source

fzf --fish | source
fzf_configure_bindings --history=\cr --directory=\cf --git_status=\cg --git_log=\e\cg --variables= --processes=

switch (uname)
    case Darwin
        rbenv init - fish | source

        if [ -f "$HOME/.google-cloud-sdk/path.fish.inc" ]
            . "$HOME/.google-cloud-sdk/path.fish.inc"
        end
end
