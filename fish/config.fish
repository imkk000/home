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

zoxide init fish | source

function only_linux
    fish_add_path /home/kk/.spicetify

    # alias
    alias cat="bat"
    alias pbcopy="xsel -b --input"
    alias pbpaste="xsel -b --output"
end

function only_darwin
    set -x BROWSER open
    set -x HOMEBREW_NO_ANALYTICS 1
    # path
    fish_add_path /opt/homebrew/bin

    # alias
    alias cat="bat"

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
set -U nvm_default_version v24.1.0
set -U function_path ~/.private-home/fish/functions
set -a fish_function_path $function_path
set -Ux LC_ALL "en_US.UTF-8"

function fish_prompt
  set -l go ""
  set -l git_branch ""
  set -l pwd (prompt_pwd --full-length-dirs=3 --dir-length=2)
  set -l dir (path dirname $pwd)
  set -l path (path basename $pwd)
  set -l name (whoami)
  switch $name
    case nattakit.b
      set name NB
    case "*"
      set name (string upper $name)
  end

  # show git branch
  if command -v git >/dev/null 2>&1
    set git_branch (git branch --show-current 2>/dev/null)
    if test -n "$git_branch"
      set git_branch (string join "" -- "(" $git_branch ")")
    end
  end

  # show go version
  if test -f "go.mod"
    if command -v go >/dev/null 2>&1
      and command -v jq >/dev/null 2>&1
      set -l go_version (go mod edit -json | jq -r ".Go")
      set -l go_module (go mod edit -json | jq -r '.Module.Path')
      set go (string join "" -- "[" $go_module "@" $go_version "]")
    end
  end

  string join "" -- \
    (set_color -o cc6699) "$name" (set_color normal) \
    (set_color brblue) " $dir" (set_color normal) \
    (set_color -oi ffa600) " $path" (set_color normal) \
    (set_color -o 99e6ff) " $git_branch" (set_color normal) \
    (set_color -o ffff4d) " $go" (set_color normal) \n \
    (set_color -o 999999) "\$> " (set_color normal)
end

function fish_right_prompt
end

function fish_mode_prompt
  switch $fish_bind_mode
    case default
      set_color -o 99ff66
      echo '[N] '
    case insert
      set_color -o ffff00
      echo '[I] '
    case replace_one
      set_color -o e6eeff
      echo '[R] '
    case visual
      set_color -o e6eeff
      echo '[V] '
    case '[*] '
      set_color -o red
      echo '[?] '
  end
  set_color normal
end

# custom bindings for fzf
fzf --fish | source
fzf_configure_bindings --history=\cr --directory=\cf --git_status=\cg --git_log=\e\cg --variables= --processes=

# abbreviation last history
function _last_history_item
    echo $history[1]
end
abbr --add !! --position anywhere --function _last_history_item

function _glab_mr_url
  glab mr view $argv[1] -F json | jq .web_url | tr -d '"'
end
alias glu=_glab_mr_url

# abbreviation key bindings
function _toggle_key_bindings
switch $fish_key_bindings
    case fish_hybrid_key_bindings
      fish_default_key_bindings
    case '*'
      fish_hybrid_key_bindings
    end
end
alias ff=_toggle_key_bindings

# often use
function new_abbr
    abbr --add $argv[1] --position anywhere $argv[2]
end

# abbreviation github cli
new_abbr ghv "gh repo view -w"
new_abbr ghcr "gh repo create --source=. --remote=origin"
new_abbr glv "glab repo view -w"
new_abbr glmc "glab mr create --remove-source-branch --squash-before-merge --target-branch="
new_abbr glmcm "glab mr create --remove-source-branch --squash-before-merge --target-branch=main"
new_abbr glmcd "glab mr create --remove-source-branch --squash-before-merge --target-branch=develop"
new_abbr glmcf "glab mr create --remove-source-branch --squash-before-merge --target-branch=features"
new_abbr gls "git log HEAD -1 --pretty=format:'%s'"

abbr --erase gup

# abbreviation git
new_abbr gds "git diff --staged"
new_abbr grsh "git reset --soft HEAD^"
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
new_abbr_go dotenv "github.com/joho/godotenv"
new_abbr_go echo "github.com/labstack/echo/v4"
new_abbr_go envconfig "github.com/kelseyhightower/envconfig"
new_abbr_go fasthttp "github.com/valyala/fasthttp"
new_abbr_go fiber "github.com/gofiber/fiber/v2"
new_abbr_go gin "github.com/gin-gonic/gin"
new_abbr_go git "github.com/go-git/go-git/v5"
new_abbr_go gitlab "gitlab.com/gitlab-org/api/client-go"
new_abbr_go goquery "github.com/PuerkitoBio/goquery"
new_abbr_go kafka "github.com/confluentinc/confluent-kafka-go/v2"
new_abbr_go mongo "go.mongodb.org/mongo-driver/mongo/v2"
new_abbr_go mongo1 "go.mongodb.org/mongo-driver/mongo"
new_abbr_go redis "github.com/redis/rueidis"
new_abbr_go resty "github.com/go-resty/resty/v2"
new_abbr_go testify "github.com/stretchr/testify"
new_abbr_go websocket "github.com/gorilla/websocket"
new_abbr_go zerolog "github.com/rs/zerolog"
new_abbr_go color "github.com/fatih/color"
new_abbr_go yaml "gopkg.in/yaml.v3"

# abbreviation path
new_abbr "..." "../.."
new_abbr "...." "../../.."
new_abbr "....." "../../../.."
new_abbr "......" "../../../../.."
new_abbr "......." "../../../../../.."
new_abbr "........" "../../../../../../.."
new_abbr "........." "../../../../../../../.."
new_abbr ".........." "../../../../../../../../.."
new_abbr "..........." "../../../../../../../../../.."
new_abbr "............" "../../../../../../../../../../.."

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
  cd $pwd
end

# source private config
source ~/.private-home/fish/config.fish
