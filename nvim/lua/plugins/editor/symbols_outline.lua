-- Plugin: https://github.com/simrat39/symbols-outline.nvim
return {
  plugins.editor.repo_symbols_outline,
  name = plugins.editor.symbols_outline,
  config = true,
  opts = {
    symbols = icons.symbols,
  },
  keys = {
    { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = " Symbols Outline" },
  },
}
