set -Ux CONFIG_DIR ~/.config
set -Ux EDITOR nvim
set -Ux LC_ALL "en_US.UTF-8"
set -Ux ASPELL_CONF "personal $HOME/.home/spell/aspell.en.pws"
set -Ux COLORTERM truecolor
set -Ux TERM screen-256color

set -U fish_greeting ""
set -U nvm_default_version v24.1.0

switch (uname)
    case Darwin
        set -Ux BROWSER open
        set -Ux HOMEBREW_NO_ANALYTICS 1
        set -Ux CONFIG_DIR ~/Library/Application\ Support
end

set -Ux _ZO_MAXAGE 999999999
set -Ux _ZO_ECHO 1
set -Ux _ZO_EXCLUDE_DIRS '*node_modules*;*.git*'
