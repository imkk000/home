#!/usr/bin/env fish

set -l path $argv

if command -v go >/dev/null 2>&1
  and command -v jq >/dev/null 2>&1
  cd $path
  set -l gomod (go mod edit -json)
  if test $status -eq 0
    set -l go_version (echo $gomod | jq -r ".Go")
    set -l go_module (echo $gomod | jq -r '.Module.Path')
    echo "  $go_module@$go_version"
  end
end
