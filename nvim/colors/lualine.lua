local colors = {
  -- Base colors from Tomorrow Fork theme
  bg_primary = "#0a0c0f",
  bg_secondary = "#0f1216",
  bg_tertiary = "#1a2128",
  fg_primary = "#8a9299",
  fg_secondary = "#5a6066",
  fg_tertiary = "#3a4248",

  -- Accent colors
  accent_primary = "#4a7a95",
  accent_secondary = "#3a6a85",
  accent_tertiary = "#3a5a75",
  accent_subtle = "#1a3545",
  accent_midnight = "#1a2a45",
  accent_sapphire = "#2a4555",

  -- Semantic colors
  success = "#5a6a5f",
  warning = "#a8955a",
  error = "#a85a57",
  info = "#3a6a85",

  -- Special UI colors
  border = "#2a4555",
  highlight = "#1a3545",
  selection = "#1a2128",
}

local tomorrow_fork = {
  normal = {
    a = { fg = colors.bg_primary, bg = colors.accent_primary, gui = "bold" },
    b = { fg = colors.fg_primary, bg = colors.bg_tertiary },
    c = { fg = colors.fg_secondary, bg = colors.bg_secondary },
    x = { fg = colors.fg_secondary, bg = colors.bg_secondary },
    y = { fg = colors.fg_primary, bg = colors.bg_tertiary },
    z = { fg = colors.bg_primary, bg = colors.accent_secondary, gui = "bold" },
  },

  insert = {
    a = { fg = colors.bg_primary, bg = colors.success, gui = "bold" },
    b = { fg = colors.fg_primary, bg = colors.bg_tertiary },
    c = { fg = colors.fg_secondary, bg = colors.bg_secondary },
    x = { fg = colors.fg_secondary, bg = colors.bg_secondary },
    y = { fg = colors.fg_primary, bg = colors.bg_tertiary },
    z = { fg = colors.bg_primary, bg = colors.success, gui = "bold" },
  },

  visual = {
    a = { fg = colors.bg_primary, bg = colors.warning, gui = "bold" },
    b = { fg = colors.fg_primary, bg = colors.bg_tertiary },
    c = { fg = colors.fg_secondary, bg = colors.bg_secondary },
    x = { fg = colors.fg_secondary, bg = colors.bg_secondary },
    y = { fg = colors.fg_primary, bg = colors.bg_tertiary },
    z = { fg = colors.bg_primary, bg = colors.warning, gui = "bold" },
  },

  replace = {
    a = { fg = colors.bg_primary, bg = colors.error, gui = "bold" },
    b = { fg = colors.fg_primary, bg = colors.bg_tertiary },
    c = { fg = colors.fg_secondary, bg = colors.bg_secondary },
    x = { fg = colors.fg_secondary, bg = colors.bg_secondary },
    y = { fg = colors.fg_primary, bg = colors.bg_tertiary },
    z = { fg = colors.bg_primary, bg = colors.error, gui = "bold" },
  },

  command = {
    a = { fg = colors.bg_primary, bg = colors.accent_tertiary, gui = "bold" },
    b = { fg = colors.fg_primary, bg = colors.bg_tertiary },
    c = { fg = colors.fg_secondary, bg = colors.bg_secondary },
    x = { fg = colors.fg_secondary, bg = colors.bg_secondary },
    y = { fg = colors.fg_primary, bg = colors.bg_tertiary },
    z = { fg = colors.bg_primary, bg = colors.accent_tertiary, gui = "bold" },
  },

  inactive = {
    a = { fg = colors.fg_tertiary, bg = colors.bg_secondary },
    b = { fg = colors.fg_tertiary, bg = colors.bg_secondary },
    c = { fg = colors.fg_tertiary, bg = colors.bg_primary },
    x = { fg = colors.fg_tertiary, bg = colors.bg_primary },
    y = { fg = colors.fg_tertiary, bg = colors.bg_secondary },
    z = { fg = colors.fg_tertiary, bg = colors.bg_secondary },
  },
}

return tomorrow_fork
