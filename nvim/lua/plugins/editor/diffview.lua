local toggle = false

-- Plugin: https://github.com/sindrets/diffview.nvim
return {
  plugins.editor.repo_diffview,
  name = plugins.editor.diffview,
  config = true,
  -- stylua: ignore
  keys = {
    {
      "<leader>gd",
      function()
        toggle = not toggle
        if toggle then
          vim.cmd("DiffviewOpen")
        else
          vim.cmd("DiffviewClose")
        end
      end,
      desc = "DiffView"
    },
  },
}
