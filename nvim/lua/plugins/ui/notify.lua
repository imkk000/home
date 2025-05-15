-- Plugin: https://github.com/rcarriga/nvim-notify
return {
  plugins.ui.repo_notify,
  name = plugins.ui.notify,
  config = true,
  opts = {
    background_colour = "#000000",
    top_down = false,
  },
  keys = {
    {
      "<leader>o",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = " Dismiss Notifications",
    },
  },
}
