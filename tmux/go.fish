#!/usr/bin/env fish

set -l path $argv

if command -v go >/dev/null 2>&1
  and command -v jq >/dev/null 2>&1
  cd $path
  set -l gomod (go list -m -json)
  set -l go_module (echo $gomod | jq -r '.Path')
  if test $status -eq 0 && [ "$go_module" != "command-line-arguments" ]
    set -l go_version (echo $gomod | jq -r ".GoVersion")
    echo "  $go_module@$go_version"
  end
end
