local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup({
  preview = {
    lines_above = 0,
    lines_below = 10,
  },
  scroll_preview = {
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
  request_timeout = 2000,

  -- See Customizing Lspsaga's Appearance
  ui = {
    -- This option only works in Neovim 0.9
    title = false,
    -- Border type can be single, double, rounded, solid, shadow.
    border = "single",
    winblend = 0,
    expand = "",
    collapse = "",
    code_action = "",
    incoming = " ",
    outgoing = " ",
    hover = ' ',
    kind = {},
  },
  -- For default options for each command, see below
  finder = {
    -- max_height = 0.5,
    -- min_width = 30,
    -- force_max_height = false,
    keys = {
      jump_to = '<CR>',
      expand_or_jump = 'o',
      vsplit = 'v',
      split = 's',
      tabe = 't',
      tabnew = 'r',
      quit = { 'q', '<ESC>' },
      close_in_preview = '<ESC>',
    },
  },

  code_action = {
    num_shortcut = true,
    show_server_name = false,
    extend_gitsigns = true,
    keys = {
      -- string | table type
      quit = { "q", "<EXC>" },
      exec = "<CR>",
    },
  },

  lightbulb = {
    enable = false,
    -- enable_in_insert = true,
    -- sign = true,
    -- sign_priority = 40,
    -- virtual_text = true,
  },

  symbol_in_winbar = {
    enable = false,
    -- separator = " ",
    -- ignore_patterns = {},
    -- hide_keyword = true,
    -- show_file = true,
    -- folder_level = 2,
    -- respect_root = false,
    -- color_mode = true,
  },

  hover = {
    -- max_width = 0.6,
    -- open_link = 'gx',
    -- open_browser = '!chrome',
  },
  -- etc.
})

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<F3>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', '<F4>', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
vim.keymap.set('n', 'gh', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
-- vim.keymap.set('n', '', '<Cmd>Lspsaga preview_definition<CR>', opts)
vim.keymap.set('n', '<F2>', '<Cmd>Lspsaga rename<CR>', opts)
