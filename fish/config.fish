fish_hybrid_key_bindings

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
alias vim="nvim"
alias v="nvim"
alias vv="nvim ."
alias python="python3"
alias cat="bat"
alias k="kubectl"
alias kctx="kubectx"

zoxide init fish | source

function only_linux
    fish_add_path /home/kk/.spicetify

    alias pbcopy="xsel -b --input"
    alias pbpaste="xsel -b --output"
end

function only_darwin
    set -x BROWSER open
    set -x HOMEBREW_NO_ANALYTICS 1

    fish_add_path /opt/homebrew/bin

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
set -x ASPELL_CONF "personal $HOME/.home/spell/aspell.en.pws"

function fish_prompt
  set -l pwd (prompt_pwd --full-length-dirs=3 --dir-length=3)
  set -l name (whoami)
  switch $name
    case nattakit.b
      set name NB
    case "*"
      set name (string upper $name)
  end

  string join "" -- \
    (set_color -o cc6699) "$name " (set_color normal) \
    (set_color -oi cc7a00) $pwd (set_color normal) \n \
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

function _glab_mr_url -a mr_id
  glab mr view $mr_id -F json | jq .web_url | tr -d '"'
end
alias glu=_glab_mr_url

# often use
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

# abbreviation kubectl
abbr --add kg "kubectl get"
abbr --add kl --set-cursor "kubectl logs -f"
abbr --add pd -c kubectl "pods"
abbr --add dv -c kubectl "deployments"
abbr --add sv -c kubectl "services"

# abbreviation golang
new_abbr gomi "go install github.com/imkk000/%@latest"
new_abbr goi "go install %@latest"
new_abbr gog "go get -u"
new_abbr gob "go build -ldflags='-w -s' -o"
new_abbr gomd "go mod tidy"

# abbreviation github cli
new_abbr ghv "gh repo view -w"
new_abbr ghcr "gh repo create --source=. --remote=origin"
new_abbr glv "glab repo view -w"
new_abbr glmc "glab mr create --remove-source-branch --squash-before-merge --target-branch="
new_abbr_no_cursor gls "git log HEAD -1 --pretty=format:'%s'"
erase_abbr gup ggu glr

# abbreviation git
new_abbr gds "git diff --staged"
new_abbr grsh "git reset --soft HEAD^"
new_abbr glr "git pull --rebase origin"

# abbreviation tmux
new_abbr td "tmux detach"
new_abbr ta "tmux attach -t"
new_abbr tls "tmux list-sessions"
new_abbr tn "tmux new-session -t"

# abbreviation docker
new_abbr dcu "docker compose up -d"
new_abbr dcd "docker compose down"
new_abbr dcp "docker compose ps -a"
new_abbr dcl "docker compose logs -f"
new_abbr dkl "docker logs -f"
new_abbr dkier "docker exec -it -exec --rm % -- sh"
new_abbr dkie "docker exec -it -exec % -- sh"
new_abbr dkia "docker image ls -a"
new_abbr dkca "docker container ls -a"

# abbreviation go package frequency used
function new_abbr_go -a name pkg
  new_abbr go$name "go get -u $pkg"
end
new_abbr_go cloudflare "github.com/cloudflare/cloudflare-go/v4"
new_abbr_go cobra "github.com/spf13/cobra"
new_abbr_go color "github.com/fatih/color"
new_abbr_go cron "github.com/robfig/cron/v3"
new_abbr_go dotenv "github.com/joho/godotenv"
new_abbr_go echo "github.com/labstack/echo/v4"
new_abbr_go envconfig "github.com/kelseyhightower/envconfig"
new_abbr_go fasthttp "github.com/valyala/fasthttp"
new_abbr_go fiber "github.com/gofiber/fiber/v2"
new_abbr_go gin "github.com/gin-gonic/gin"
new_abbr_go git "github.com/go-git/go-git/v5"
new_abbr_go gitlab "gitlab.com/gitlab-org/api/client-go"
new_abbr_go godump "github.com/goforj/godump"
new_abbr_go goquery "github.com/PuerkitoBio/goquery"
new_abbr_go kafka "github.com/confluentinc/confluent-kafka-go/v2"
new_abbr_go mongo "go.mongodb.org/mongo-driver/mongo/v2"
new_abbr_go mongo1 "go.mongodb.org/mongo-driver/mongo"
new_abbr_go redis "github.com/redis/rueidis"
new_abbr_go resty "github.com/go-resty/resty/v2"
new_abbr_go testify "github.com/stretchr/testify"
new_abbr_go urfavecli "github.com/urfave/cli/v3"
new_abbr_go uuid "github.com/google/uuid"
new_abbr_go viper "github.com/spf13/viper"
new_abbr_go websocket "github.com/gorilla/websocket"
new_abbr_go yaml "gopkg.in/yaml.v3"
new_abbr_go zerolog "github.com/rs/zerolog"

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
