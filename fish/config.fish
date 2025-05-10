# set default PATH
fish_add_path ~/.go/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin

# set default alias
alias fish_reload="source $HOME/.config/fish/config.fish"
alias ls="eza -g --color=always"
alias l="ls"
alias e="exit"
alias c="clear"
alias k="kubectl"
alias vim="nvim"
alias v="nvim"
alias vv="nvim ."
alias python="python3"

function only_linux
    fish_add_path /home/kk/.spicetify

    # alias
    alias cat="batcat"
    alias pbcopy="xsel -b --input"
    alias pbpaste="xsel -b --output"
end

function only_darwin
    # iterm2 shell integration
    source $HOME/.iterm2_shell_integration.fish
    set -x BROWSER open
    set -x HOMEBREW_NO_ANALYTICS 1
    # path
    fish_add_path /opt/homebrew/bin

    # alias
    alias cat="bat"
    alias ff="open -a Firefox -n"

    if [ -f "$HOME/.google-cloud-sdk/path.fish.inc" ]; . "$HOME/.google-cloud-sdk/path.fish.inc"; end
end

# select os
switch (uname)
    case Darwin
        only_darwin
    case Linux
        only_linux
end

# common
set -Ux EDITOR nvim
set -U fish_greeting ""
set -U nvm_default_version v23.11.0
set -U function_path ~/.private-dotfiles/fish/functions
set -a fish_function_path $function_path

# custom pure themes
set -U pure_symbol_prompt "󰄛"
set -U pure_show_system_time false
set -U pure_shorten_prompt_current_directory_length 1

# custom bindings for fzf
fzf --fish | source
fzf_configure_bindings --history=\cr --directory=\cf --variables= --processes= --git_log= --git_status=\cg

# abbreviation last history
function last_history_item
    echo $history[1]
end
abbr --add !! --position anywhere --function last_history_item

# often use
function new_abbr
    abbr --add $argv[1] --position anywhere $argv[2]
end

function glab_mr_url
  glab mr view $argv[1] -F json | jq .web_url | tr -d '"'
end

# abbreviation fish
new_abbr fde "fish_default_key_bindings"
new_abbr fvi "fish_vi_key_bindings"

# abbreviation github cli
new_abbr ghv "gh repo view -w"
new_abbr ghcp "gh repo create --source=. --remote=origin --private"
new_abbr ghcu "gh repo create --source=. --remote=origin --public"
new_abbr glv "glab repo view -w"
new_abbr glmc "glab mr create --remove-source-branch --squash-before-merge --target-branch="
new_abbr glmcm "glab mr create --remove-source-branch --squash-before-merge --target-branch=main"
new_abbr glmcd "glab mr create --remove-source-branch --squash-before-merge --target-branch=develop"
new_abbr glmcf "glab mr create --remove-source-branch --squash-before-merge --target-branch=features"
abbr --erase gup

# abbreviation git
new_abbr gds "git diff --staged"
new_abbr grsh "git reset --soft HEAD^"
new_abbr gcue "git config user.email nattakit.boonyang@gmail.com"
new_abbr glrd "git pull --rebase origin develop"
new_abbr glrm "git pull --rebase origin main"

# abbreviation tmux
new_abbr td "tmux detach"
new_abbr ta "tmux attach"
new_abbr tls "tmux list-sessions"
new_abbr tn "tmux new-session"

# abbreviation docker
new_abbr dcu "docker compose up -d"
new_abbr dcd "docker compose down"
new_abbr dcp "docker compose ps -a"
new_abbr dcl "docker compose logs -f"
new_abbr dkcl "docker container ls -a"
new_abbr dkl "docker logs -f"

# abbreviation go package frequency used
function new_abbr_go
  new_abbr go$argv[1] "go get -u $argv[2]"
end
new_abbr_go zerolog "github.com/rs/zerolog"
new_abbr_go testify "github.com/stretchr/testify"
new_abbr_go gin "github.com/gin-gonic/gin"
new_abbr_go echo "github.com/labstack/echo/v4"
new_abbr_go fiber "github.com/gofiber/fiber/v2"
new_abbr_go fasthttp "github.com/valyala/fasthttp"
new_abbr_go kafka "github.com/confluentinc/confluent-kafka-go/v2"
new_abbr_go dotenv "github.com/joho/godotenv"
new_abbr_go envconfig "github.com/kelseyhightower/envconfig"
new_abbr_go mongo "go.mongodb.org/mongo-driver/mongo"
new_abbr_go resty "github.com/go-resty/resty/v2"
new_abbr_go goquery "github.com/PuerkitoBio/goquery"
new_abbr_go websocket "github.com/gorilla/websocket"
new_abbr_go redis "github.com/redis/rueidis"

# abbreviation path
new_abbr "..." "../.."
new_abbr "...." "../../.."
new_abbr "....." "../../../.."
new_abbr "......" "../../../../.."
new_abbr "......." "../../../../../.."

function go_new_poc -a mod_name path_name
  set -l pwd $PWD
  if test -z $mod_name
    set mod_name poc
  end
  if not test -z $path_name
    mkdir $path_name
    cd $path_name
  end

  echo mod  = $mod_name
  echo path = $path_name
  echo pwd  = $pwd\n

  set -l go_version 1.$(go env GOVERSION | awk -F'.' '{print $2}')
  go mod init $mod_name
  go mod edit -go=$go_version
  go get -u github.com/rs/zerolog
  echo -e "package main\n\nimport \"github.com/rs/zerolog/log\"\n\nfunc main() {\n\tlog.Debug().Msg(\"\")\n}\n" > main.go

  git init
  git config user.email nattakit.boonyang@gmail.com

  cd $pwd
end

# source private config
source ~/.private-dotfiles/fish/config.fish
