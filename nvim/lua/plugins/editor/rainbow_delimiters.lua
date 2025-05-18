-- Plugin: https://github.com/HiPhish/rainbow-delimiters.nvim
return {
  plugins.editor.repo_rainbow_delimiters,
  name = plugins.editor.rainbow_delimiters,
  lazy = true,
  opts = {
    strategy = {
      [""] = "rainbow-delimiters.strategy.global",
      vim = "rainbow-delimiters.strategy.local",
    },
    query = {
      [""] = "rainbow-delimiters",
      lua = "rainbow-blocks",
    },
    highlight = {
      "RainbowDelimiterYellow",
      "RainbowDelimiterRed",
      "RainbowDelimiterBlue",
      "RainbowDelimiterOrange",
      "RainbowDelimiterGreen",
      "RainbowDelimiterViolet",
      "RainbowDelimiterCyan",
    },
  },
  config = function(_, opts)
    require("rainbow-delimiters.setup").setup(opts)
  end,
}
