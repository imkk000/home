function new_abbr -a name command
    abbr --add $name --position anywhere --set-cursor $command
end

function new_abbr_no_cursor -a name command
    abbr --add $name --position anywhere $command
end

function erase_abbr
    for name in $argv
        abbr --erase $name
    end
end

function new_abbr_go -a name pkg
    new_abbr go$name "go get -u $pkg"
end
