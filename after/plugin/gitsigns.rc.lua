require('gitsigns').setup {
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 150,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<committer> - <summary>, <author_time:%Y/%m/%d %H:%M>.',
}
