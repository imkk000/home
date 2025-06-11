-- Plugin: https://github.com/HiPhish/rainbow-delimiters.nvim
return {
  plugins.editor.repo_rainbow_delimiters,
  name = plugins.editor.rainbow_delimiters,
  event = "VimEnter",
  opts = {
    strategy = {
      [""] = "rainbow-delimiters.strategy.global",
      vim = "rainbow-delimiters.strategy.local",
    },
    query = {
      [""] = "rainbow-delimiters",
      lua = "rainbow-blocks",
    },
    priority = {
      [""] = 110,
      lua = 210,
    },
    highlight = {
      "RainbowDelimiterYellow",
      "RainbowDelimiterCyan",
      "RainbowDelimiterOrange",
      "RainbowDelimiterBlue",
      "RainbowDelimiterGreen",
      "RainbowDelimiterViolet",
      "RainbowDelimiterRed",
    },
  },
  config = function(_, opts)
    vim.g.rainbow_delimeters = opts
  end,
}
