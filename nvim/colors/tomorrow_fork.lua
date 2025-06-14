-- Color palette
vim.g.colors_name = "tomorrow_fork"

local colors = {
  -- Ultra dark backgrounds
  bg_primary = "#0a0c0f",   -- Ultra dark background
  bg_alt = "#0f1216",       -- Alternative background
  bg_highlight = "#1a2128", -- Highlight background
  bg_selection = "#1a3545", -- Selection background

  -- Foreground colors
  fg_primary = "#8a9299", -- Main text (whisper soft)
  fg_dim = "#5a6066",     -- Dimmed text
  fg_comment = "#3a4248", -- Comments (subtle)

  -- Accent colors (muted blues)
  blue_muted = "#4a7a95",    -- Primary blue accent
  cyan_soft = "#3a6a85",     -- Soft cyan
  blue_deep = "#3a5a75",     -- Deep blue
  blue_midnight = "#1a2a45", -- Midnight blue

  -- Status colors (muted)
  green_muted = "#5a6a5f",  -- Success/strings
  yellow_muted = "#a8955a", -- Warnings
  red_soft = "#a85a57",     -- Errors
  purple_muted = "#6a5a85", -- Special

  -- UI colors
  border = "#2a4555", -- Borders and separators
  cursor = "#4a6b85", -- Cursor color

  diagnostic_warning = "#9A8B4A",
  diagnostic_error = "#9A5B58",
  diagnostic_info = "#5A7A5F",
  diagnostic_hint = "#65758A",
  diagnostic_ok = "#5F8F5F",
  diagnostic_deprecated = "#5A5B5F",
  diagnostic_unnecessary = "#7A6B5F",
}

-- Helper function to set highlights
local function highlight(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Rainbow delimiters
highlight("RainbowDelimiterRed", { fg = "#C55A5A" })
highlight("RainbowDelimiterYellow", { fg = "#C9A865" })
highlight("RainbowDelimiterOrange", { fg = "#B8845A" })
highlight("RainbowDelimiterGreen", { fg = "#7FA05F" })
highlight("RainbowDelimiterBlue", { fg = "#5A8FC7" })
highlight("RainbowDelimiterViolet", { fg = "#A565B8" })
highlight("RainbowDelimiterCyan", { fg = "#4A9AA0" })

-- Diagnostic colors
highlight("DiagnosticError", { fg = colors.diagnostic_error })
highlight("DiagnosticWarning", { fg = colors.diagnostic_warning })
highlight("DiagnosticWarn", { fg = colors.diagnostic_warning })
highlight("DiagnosticHint", { fg = colors.diagnostic_hint })
highlight("DiagnosticInfo", { fg = colors.diagnostic_info })
highlight("DiagnosticOk", { fg = colors.diagnostic_ok })
highlight("DiagnosticFloatingError", { fg = colors.diagnostic_error })
highlight("DiagnosticFloatingWarning", { fg = colors.diagnostic_warning })
highlight("DiagnosticFloatingWarn", { fg = colors.diagnostic_warning })
highlight("DiagnosticFloatingHint", { fg = colors.diagnostic_hint })
highlight("DiagnosticFloatingInfo", { fg = colors.diagnostic_info })
highlight("DiagnosticFloatingOk", { fg = colors.diagnostic_ok })
highlight("DiagnosticSignError", { fg = colors.diagnostic_error })
highlight("DiagnosticSignWarning", { fg = colors.diagnostic_warning })
highlight("DiagnosticSignWarn", { fg = colors.diagnostic_warning })
highlight("DiagnosticSignHint", { fg = colors.diagnostic_hint })
highlight("DiagnosticSignInfo", { fg = colors.diagnostic_info })
highlight("DiagnosticSignOk", { fg = colors.diagnostic_ok })
highlight("DiagnosticUnderlineError", { fg = colors.diagnostic_error })
highlight("DiagnosticUnderlineWarning", { fg = colors.diagnostic_warning })
highlight("DiagnosticUnderlineWarn", { fg = colors.diagnostic_warning })
highlight("DiagnosticUnderlineHint", { fg = colors.diagnostic_hint })
highlight("DiagnosticUnderlineInfo", { fg = colors.diagnostic_info })
highlight("DiagnosticUnderlineOk", { fg = colors.diagnostic_ok })
highlight("DiagnosticVirtualLinesError", { fg = colors.diagnostic_error })
highlight("DiagnosticVirtualLinesWarning", { fg = colors.diagnostic_warning })
highlight("DiagnosticVirtualLinesWarn", { fg = colors.diagnostic_warning })
highlight("DiagnosticVirtualLinesHint", { fg = colors.diagnostic_hint })
highlight("DiagnosticVirtualLinesInfo", { fg = colors.diagnostic_info })
highlight("DiagnosticVirtualLinesOk", { fg = colors.diagnostic_ok })
highlight("DiagnosticVirtualTextError", { fg = colors.diagnostic_error })
highlight("DiagnosticVirtualTextWarning", { fg = colors.diagnostic_warning })
highlight("DiagnosticVirtualTextWarn", { fg = colors.diagnostic_warning })
highlight("DiagnosticVirtualTextHint", { fg = colors.diagnostic_hint })
highlight("DiagnosticVirtualTextInfo", { fg = colors.diagnostic_info })
highlight("DiagnosticVirtualTextOk", { fg = colors.diagnostic_ok })
highlight("DiagnosticDeprecated", { fg = colors.diagnostic_deprecated })
highlight("DiagnosticUnnecessary", { fg = colors.diagnostic_unnecessary })

-- Editor background and text
highlight("Normal", { fg = colors.fg_primary, bg = colors.bg_primary })
highlight("NormalFloat", { fg = colors.fg_primary, bg = colors.bg_alt })
highlight("NormalNC", { fg = colors.fg_dim, bg = colors.bg_primary })

-- Cursor and cursor line
highlight("Cursor", { fg = colors.bg_primary, bg = colors.cursor })
highlight("CursorLine", { bg = colors.bg_alt })
highlight("CursorColumn", { bg = colors.bg_alt })
highlight("CursorLineNr", { fg = colors.blue_muted, bg = colors.bg_alt, bold = true })

-- Line numbers
highlight("LineNr", { fg = colors.fg_comment, bg = colors.bg_primary })
highlight("SignColumn", { fg = colors.fg_comment, bg = colors.bg_primary })

-- Visual selection
highlight("Visual", { bg = colors.bg_selection })
highlight("VisualNOS", { bg = colors.bg_selection })

-- Search highlighting
highlight("Search", { fg = colors.bg_primary, bg = colors.yellow_muted })
highlight("IncSearch", { fg = colors.bg_primary, bg = colors.cyan_soft })
highlight("CurSearch", { fg = colors.bg_primary, bg = colors.blue_muted, bold = true })

-- Comments
highlight("Comment", { fg = colors.fg_comment, italic = true })

-- Constants and literals
highlight("Constant", { fg = colors.purple_muted })
highlight("String", { fg = colors.green_muted })
highlight("Character", { fg = colors.green_muted })
highlight("Number", { fg = colors.yellow_muted })
highlight("Boolean", { fg = colors.purple_muted })
highlight("Float", { fg = colors.yellow_muted })

-- Identifiers and variables
highlight("Identifier", { fg = colors.fg_primary })
highlight("Function", { fg = colors.cyan_soft })

-- Keywords and statements
highlight("Statement", { fg = colors.blue_muted })
highlight("Conditional", { fg = colors.blue_muted })
highlight("Repeat", { fg = colors.blue_muted })
highlight("Label", { fg = colors.blue_muted })
highlight("Operator", { fg = colors.purple_muted })
highlight("Keyword", { fg = colors.blue_muted })
highlight("Exception", { fg = colors.red_soft })

-- Preprocessor
highlight("PreProc", { fg = colors.cyan_soft })
highlight("Include", { fg = colors.cyan_soft })
highlight("Define", { fg = colors.cyan_soft })
highlight("Macro", { fg = colors.cyan_soft })
highlight("PreCondit", { fg = colors.cyan_soft })

-- Types
highlight("Type", { fg = colors.blue_deep })
highlight("StorageClass", { fg = colors.blue_muted })
highlight("Structure", { fg = colors.blue_deep })
highlight("Typedef", { fg = colors.blue_deep })

-- Special characters
highlight("Special", { fg = colors.purple_muted })
highlight("SpecialChar", { fg = colors.purple_muted })
highlight("Tag", { fg = colors.cyan_soft })
highlight("Delimiter", { fg = colors.fg_primary })
highlight("SpecialComment", { fg = colors.fg_comment, italic = true })
highlight("Debug", { fg = colors.red_soft })

-- Status line
highlight("StatusLine", { fg = colors.fg_primary, bg = colors.bg_alt })
highlight("StatusLineNC", { fg = colors.fg_dim, bg = colors.bg_alt })

-- Tab line
highlight("TabLine", { fg = colors.fg_dim, bg = colors.bg_alt })
highlight("TabLineFill", { bg = colors.bg_alt })
highlight("TabLineSel", { fg = colors.bg_primary, bg = colors.blue_muted, bold = true })

-- Window splits
highlight("VertSplit", { fg = colors.border, bg = colors.bg_primary })
highlight("WinSeparator", { fg = colors.border, bg = colors.bg_primary })

-- Popup menu (completion)
highlight("Pmenu", { fg = colors.fg_primary, bg = colors.bg_alt })
highlight("PmenuSel", { fg = colors.bg_primary, bg = colors.blue_muted })
highlight("PmenuSbar", { bg = colors.bg_highlight })
highlight("PmenuThumb", { bg = colors.blue_muted })

-- Error and warning messages
highlight("Error", { fg = colors.red_soft, bg = colors.bg_primary })
highlight("ErrorMsg", { fg = colors.red_soft, bold = true })
highlight("WarningMsg", { fg = colors.yellow_muted, bold = true })
highlight("ModeMsg", { fg = colors.blue_muted, bold = true })
highlight("MoreMsg", { fg = colors.cyan_soft })
highlight("Question", { fg = colors.cyan_soft })

highlight("DiffAdd", { fg = colors.green_muted, bg = colors.bg_primary })
highlight("DiffChange", { fg = colors.yellow_muted, bg = colors.bg_primary })
highlight("DiffDelete", { fg = colors.red_soft, bg = colors.bg_primary })
highlight("DiffText", { fg = colors.bg_primary, bg = colors.yellow_muted })

highlight("SpellBad", { fg = colors.red_soft, undercurl = true })
highlight("SpellCap", { fg = colors.yellow_muted, undercurl = true })
highlight("SpellLocal", { fg = colors.cyan_soft, undercurl = true })
highlight("SpellRare", { fg = colors.purple_muted, undercurl = true })

-- Folding
highlight("Folded", { fg = colors.fg_dim, bg = colors.bg_alt, italic = true })
highlight("FoldColumn", { fg = colors.fg_comment, bg = colors.bg_primary })

-- Matching parentheses
highlight("MatchParen", { fg = colors.bg_primary, bg = colors.blue_muted, bold = true })

-- Non-text elements
highlight("NonText", { fg = colors.fg_comment })
highlight("SpecialKey", { fg = colors.fg_comment })
highlight("Whitespace", { fg = colors.fg_comment })

-- Title and directory
highlight("Title", { fg = colors.blue_muted, bold = true })
highlight("Directory", { fg = colors.cyan_soft })

-- Wild menu
highlight("WildMenu", { fg = colors.bg_primary, bg = colors.blue_muted })

-- Terminal
vim.g.terminal_color_0 = colors.bg_primary
vim.g.terminal_color_1 = colors.red_soft
vim.g.terminal_color_2 = colors.green_muted
vim.g.terminal_color_3 = colors.yellow_muted
vim.g.terminal_color_4 = colors.blue_muted
vim.g.terminal_color_5 = colors.purple_muted
vim.g.terminal_color_6 = colors.cyan_soft
vim.g.terminal_color_7 = colors.fg_primary
vim.g.terminal_color_8 = colors.fg_comment
vim.g.terminal_color_9 = colors.red_soft
vim.g.terminal_color_10 = colors.green_muted
vim.g.terminal_color_11 = colors.yellow_muted
vim.g.terminal_color_12 = colors.blue_muted
vim.g.terminal_color_13 = colors.purple_muted
vim.g.terminal_color_14 = colors.cyan_soft
vim.g.terminal_color_15 = colors.fg_primary

if not vim.treesitter then
  return
end

-- Comments and documentation
highlight("@comment", { fg = colors.fg_comment, italic = true })
highlight("@comment.documentation", { fg = colors.fg_comment, italic = true })
highlight("@comment.error", { fg = colors.red_soft, italic = true })
highlight("@comment.warning", { fg = colors.yellow_muted, italic = true })
highlight("@comment.todo", { fg = colors.cyan_soft, italic = true, bold = true })
highlight("@comment.note", { fg = colors.blue_muted, italic = true })

-- Constants and literals
highlight("@constant", { fg = colors.purple_muted })
highlight("@constant.builtin", { fg = colors.purple_muted, bold = true })
highlight("@constant.macro", { fg = colors.purple_muted })

-- Strings and characters
highlight("@string", { fg = colors.green_muted })
highlight("@string.documentation", { fg = colors.green_muted, italic = true })
highlight("@string.regex", { fg = colors.green_muted, bold = true })
highlight("@string.escape", { fg = colors.cyan_soft })
highlight("@string.special", { fg = colors.cyan_soft })
highlight("@character", { fg = colors.green_muted })
highlight("@character.special", { fg = colors.cyan_soft })

-- Numbers and booleans
highlight("@number", { fg = colors.yellow_muted })
highlight("@number.float", { fg = colors.yellow_muted })
highlight("@boolean", { fg = colors.purple_muted })

-- Identifiers and variables
highlight("@variable", { fg = colors.fg_primary })
highlight("@variable.builtin", { fg = colors.blue_deep })
highlight("@variable.parameter", { fg = colors.fg_primary })
highlight("@variable.member", { fg = colors.fg_primary })

-- Functions
highlight("@function", { fg = colors.cyan_soft })
highlight("@function.builtin", { fg = colors.cyan_soft, bold = true })
highlight("@function.call", { fg = colors.cyan_soft })
highlight("@function.macro", { fg = colors.cyan_soft })
highlight("@function.method", { fg = colors.cyan_soft })
highlight("@function.method.call", { fg = colors.cyan_soft })

-- Constructors and types
highlight("@constructor", { fg = colors.blue_deep })
highlight("@type", { fg = colors.blue_deep })
highlight("@type.builtin", { fg = colors.blue_deep, bold = true })
highlight("@type.definition", { fg = colors.blue_deep })

-- Keywords and statements
highlight("@keyword", { fg = colors.blue_muted })
highlight("@keyword.coroutine", { fg = colors.blue_muted })
highlight("@keyword.function", { fg = colors.blue_muted })
highlight("@keyword.operator", { fg = colors.blue_muted })
highlight("@keyword.return", { fg = colors.blue_muted })
highlight("@keyword.debug", { fg = colors.red_soft })
highlight("@keyword.exception", { fg = colors.red_soft })
highlight("@keyword.conditional", { fg = colors.blue_muted })
highlight("@keyword.conditional.ternary", { fg = colors.blue_muted })
highlight("@keyword.repeat", { fg = colors.blue_muted })
highlight("@keyword.storage", { fg = colors.blue_muted })
highlight("@keyword.directive", { fg = colors.cyan_soft })
highlight("@keyword.directive.define", { fg = colors.cyan_soft })

-- Operators and punctuation
highlight("@operator", { fg = colors.purple_muted })
highlight("@punctuation.delimiter", { fg = colors.fg_primary })
highlight("@punctuation.bracket", { fg = colors.fg_primary })
highlight("@punctuation.special", { fg = colors.purple_muted })

-- Modules and namespaces
highlight("@module", { fg = colors.red_soft })
highlight("@module.builtin", { fg = colors.red_soft, bold = true })
highlight("@namespace", { fg = colors.red_soft })
highlight("@namespace.builtin", { fg = colors.red_soft, bold = true })

-- Labels and tags
highlight("@label", { fg = colors.blue_muted })
highlight("@tag", { fg = colors.blue_muted })
highlight("@tag.builtin", { fg = colors.blue_muted, bold = true })
highlight("@tag.attribute", { fg = colors.cyan_soft })
highlight("@tag.delimiter", { fg = colors.fg_primary })

-- Properties and fields
highlight("@property", { fg = colors.fg_primary })
highlight("@field", { fg = colors.fg_primary })
highlight("@attribute", { fg = colors.cyan_soft })
highlight("@attribute.builtin", { fg = colors.cyan_soft, bold = true })

-- Parameters and arguments
highlight("@parameter", { fg = colors.fg_primary })
highlight("@parameter.builtin", { fg = colors.blue_deep })

-- Special symbols
highlight("@symbol", { fg = colors.purple_muted })

-- Text elements (for markdown, etc.)
highlight("@text", { fg = colors.fg_primary })
highlight("@text.strong", { fg = colors.fg_primary, bold = true })
highlight("@text.emphasis", { fg = colors.fg_primary, italic = true })
highlight("@text.underline", { fg = colors.fg_primary, underline = true })
highlight("@text.strike", { fg = colors.fg_dim, strikethrough = true })
highlight("@text.title", { fg = colors.blue_muted, bold = true })
highlight("@text.title.1", { fg = colors.blue_muted, bold = true })
highlight("@text.title.2", { fg = colors.blue_muted, bold = true })
highlight("@text.title.3", { fg = colors.blue_muted, bold = true })
highlight("@text.title.4", { fg = colors.blue_muted, bold = true })
highlight("@text.title.5", { fg = colors.blue_muted, bold = true })
highlight("@text.title.6", { fg = colors.blue_muted, bold = true })
highlight("@text.quote", { fg = colors.green_muted, italic = true })
highlight("@text.uri", { fg = colors.cyan_soft, underline = true })
highlight("@text.math", { fg = colors.yellow_muted })
highlight("@text.environment", { fg = colors.purple_muted })
highlight("@text.environment.name", { fg = colors.blue_deep })
highlight("@text.reference", { fg = colors.cyan_soft })
highlight("@text.literal", { fg = colors.green_muted })
highlight("@text.literal.block", { fg = colors.green_muted })

-- Error handling
highlight("@error", { fg = colors.red_soft })
highlight("@warning", { fg = colors.yellow_muted })
highlight("@info", { fg = colors.cyan_soft })
highlight("@hint", { fg = colors.blue_muted })

-- Diff highlighting
highlight("@diff.plus", { fg = colors.green_muted })
highlight("@diff.minus", { fg = colors.red_soft })
highlight("@diff.delta", { fg = colors.yellow_muted })

-- Spell checking
highlight("@spell", { fg = colors.fg_primary })
highlight("@nospell", { fg = colors.fg_primary })

-- Conceal
highlight("@conceal", { fg = colors.fg_comment })

-- None/empty
highlight("@none", { fg = colors.fg_primary })

-- Semantic token highlights (LSP + Treesitter)
highlight("@lsp.type.comment", { link = "@comment" })
highlight("@lsp.type.enum", { link = "@type" })
highlight("@lsp.type.interface", { link = "@type" })
highlight("@lsp.type.keyword", { link = "@keyword" })
highlight("@lsp.type.namespace", { link = "@namespace" })
highlight("@lsp.type.parameter", { link = "@parameter" })
highlight("@lsp.type.property", { link = "@property" })
highlight("@lsp.type.variable", { link = "@variable" })
highlight("@lsp.type.enumMember", { link = "@constant" })
highlight("@lsp.type.function", { link = "@function" })
highlight("@lsp.type.method", { link = "@function.method" })
highlight("@lsp.type.macro", { link = "@constant.macro" })
highlight("@lsp.type.decorator", { link = "@attribute" })

-- Support for older treesitter highlight names
highlight("TSComment", { link = "@comment" })
highlight("TSString", { link = "@string" })
highlight("TSNumber", { link = "@number" })
highlight("TSBoolean", { link = "@boolean" })
highlight("TSFunction", { link = "@function" })
highlight("TSKeyword", { link = "@keyword" })
highlight("TSType", { link = "@type" })
highlight("TSVariable", { link = "@variable" })
highlight("TSConstant", { link = "@constant" })
highlight("TSOperator", { link = "@operator" })
highlight("TSPunctDelimiter", { link = "@punctuation.delimiter" })
highlight("TSPunctBracket", { link = "@punctuation.bracket" })
highlight("TSError", { link = "@error" })
