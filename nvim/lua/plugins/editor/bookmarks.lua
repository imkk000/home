-- Plugin: https://github.com/tomasky/bookmarks.nvim
return {
  plugins.editor.repo_bookmarks,
  name = plugins.editor.bookmarks,
  event = "VimEnter",
  config = function()
    require("bookmarks").setup()
  end,
  keys = {
    -- stylua: ignore
    { "gm", function() require("bookmarks").bookmark_toggle() end, desc = "Toggle Bookmarks" },
    -- stylua: ignore
    { "'",  function() require("bookmarks").bookmark_prev() end,   desc = "Prev Bookmarks" },
    -- stylua: ignore
    { "\"", function() require("bookmarks").bookmark_next() end,   desc = "Next Bookmarks" },
  },
}
