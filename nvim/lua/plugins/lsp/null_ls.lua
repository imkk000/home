-- Plugin: https://github.com/nvimtools/none-ls.nvim
return {
  plugins.lsp.repo_null_ls,
  name = plugins.lsp.null_ls,
  dependencies = plugins.lsp.mason,
  event = { "BufReadPre", "BufNewFile" },
  opts = function()
    return {
      diagnostics_format = "#{m} (#{s})",
      diagnostic_config = {
        virtual_text = true,
        underline = false,
        signs = true,
      },
      sources = servers.sources_null_ls(),
    }
  end,
}
