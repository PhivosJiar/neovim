local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = false,
    disable = {},
  },
  indent = {
    enable = false,
    disable = { "python" },
  },
  auto_install = true,
  ensure_installed = {
    "tsx",
    "typescript",
    "javascript",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    "swift",
    "css",
    "scss",
    "html",
    "lua",
    "graphql",
    "go",
    "markdown",
    "markdown_inline",
  },
  sync_install = false,
  autotag = {
    enable = true,
  },
}
