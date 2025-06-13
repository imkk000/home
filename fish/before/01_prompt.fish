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
    (set_color -o 8a7a42) $pwd (set_color normal) \n \
    (set_color -o 999999) "\$> " (set_color normal)
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
