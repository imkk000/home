set -g fish_yank_register ""

function yank_line
    set -g fish_yank_register (commandline -b)
    # Also copy to system clipboard
    echo $fish_yank_register | fish_clipboard_copy
    commandline ""
end

function yank_selection
    set -g fish_yank_register (commandline -s)
    echo $fish_yank_register | fish_clipboard_copy
    commandline -f cancel
end

function paste_from_register
    if test -n "$fish_yank_register"
        commandline -i $fish_yank_register
    end
end

bind -M default yy yank_line
bind -M visual y yank_selection
bind -M default p paste_from_register
bind -M insert \cp paste_from_register
