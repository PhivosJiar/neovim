local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

-- local function telescope_buffer_dir()
--   return vim.fn.expand('%:p:h')
-- end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["<space>q"] = actions.close,
        ["<Esc>"] = actions.close,
      },
    },
    scroll_strategy = "limit",
    hidden = false,
    file_ignore_patterns = { "node_modules" },
    path_display = { "tail" },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      previewer = false,
      initial_mode = "normal",
      hidden = true,
      grouped = true,
      respect_gitignore = false,
      layout_config = {
        height = 40,
      },
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      path_display = { "tail" },
      hide_parent_dir = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["a"] = fb_actions.create,
          ["r"] = fb_actions.rename,
          ["y"] = fb_actions.copy,
          ["d"] = fb_actions.remove,
          ["s"] = actions.select_horizontal,
          ["v"] = actions.select_vertical,
          ["l"] = actions.select_default,
          ["h"] = fb_actions.goto_parent_dir,
          ["<BackSpace>"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
  },
}

vim.keymap.set('n', '<space>f',
  function()
    builtin.find_files()
  end)
vim.keymap.set('n', ';r', function()
  builtin.live_grep()
end)
vim.keymap.set('n', '\\\\', function()
  builtin.buffers({
    initial_mode = "normal",
  })
end)
vim.keymap.set('n', ';;', function()
  builtin.resume({
    initial_mode = "normal",
  })
end)
vim.keymap.set('n', ';e', function()
  builtin.diagnostics({
    initial_mode = "normal",
  })
end)

require 'telescope'.setup {
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = { "png", "webp", "jpg", "jpeg" },
      find_cmd = "rg" -- find command (defaults to `fd`)
    }
  },
}
-- vim.keymap.set('n', '<space>t', function()
--   builtin.help_tags()
-- end)
-- vim.keymap.set("n", "<space>ef", function()
--   telescope.extensions.file_browser.file_browser({
--     path = "%:p:h",
--     cwd = telescope_buffer_dir(),
--   })
-- end)
