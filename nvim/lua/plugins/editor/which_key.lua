-- Plugin: https://github.com/folke/which-key.nvim
return {
  plugins.editor.repo_which_key,
  name = plugins.editor.which_key,
  event = "VeryLazy",
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.add({
      {
        mode = { "n", "v" },
        { "<leader>b", group = " Buffer" },
        { "<leader>d", group = " Dap" },
        { "<leader>f", group = "󰮗 Find" },
        { "<leader>g", group = " Git" },
        { "<leader>c", group = "󰨽 Code" },
        { "<leader>q", group = "󰗼 Exit" },
        { "[", group = " Prev" },
        { "]", group = " Next" },
        { "g", group = "󰷕 Goto" },
        { "gz", group = "󰅪 Surround" },
      },
    })
  end,
}
