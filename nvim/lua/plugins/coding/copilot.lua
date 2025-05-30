-- Plugin: https://github.com/zbirenbaum/copilot.lua
return {
  plugins.coding.completion.repo_copilot,
  name = plugins.coding.completion.copilot,
  cmd = "Copilot",
  event = "InsertEnter",
  config = true,
  opts = {
    suggestion = { enabled = false },
    panel = { enabled = false },
    filetypes = { ["*"] = true },
    server_opts_overrides = {
      settings = {
        telemetry = {
          telemetryLevel = "off",
        },
      },
    },
  },
}
