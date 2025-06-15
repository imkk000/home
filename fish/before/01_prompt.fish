function fish_prompt
    set -l last_status $status
    set -l pwd (prompt_pwd --full-length-dirs=3 --dir-length=3)
    set -l name (whoami)
    switch $name
        case nattakit.b
            set name NB
        case "*"
            set name (string upper $name)
    end

    set_color -o cc6699
    echo -n $name
    set_color normal

    set_color -o 8a7a42
    echo -n " $pwd"
    set_color normal

    if test $last_status -ne 0
        set_color -o brred
        echo -n " [ $last_status ]"
        set_color normal
    end
    echo
    set_color 999999
    echo -n "\$> "
    set_color normal
end

function fish_right_prompt
end

function fish_mode_prompt
    switch $fish_bind_mode
        case default
            set_color -o 4a7a95
            echo '[N] '
        case insert
            set_color -o 5a6a5f
            echo '[I] '
        case replace_one
            set_color -o a8955a
            echo '[R] '
        case visual
            set_color -o 3a6a85
            echo '[V] '
        case '*'
            set_color -o a85a57
            echo '[?] '
    end
    set_color normal
end
