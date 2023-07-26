-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = " "

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")

-- Map Esc to kk
map("i", "kk", "<Esc>")

-- Clear search highlighting with <leader> and c
map("n", "<leader>/", ":nohl<CR>")

-- Toggle auto-indenting for code paste
map("n", "<F2>", ":set invpaste paste?<CR>")
vim.opt.pastetoggle = "<F2>"

-- Move around splits using Ctrl + {h,j,k,l}
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

-- Reload configuration without restart nvim
map("n", "<leader>r", ":so %<CR>")

-- Close all windows and exit from Neovim with <leader> and q
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>qa", ":qa!<CR>")

-- Save file
map("n", "<leader>w", ":w<CR>")

-- Move line
map("n", "∆", ":m .+1<CR>==")
map("n", "˚", ":m .-2<CR>==")
map("i", "∆", "<Esc>:m .+1<CR>==gi")
map("i", "˚", "<Esc>:m .-2<CR>==gi")
map("v", "∆", ":m '>+1<CR>gv=gv")
map("v", "˚", ":m '<-2<CR>gv=gv")

-- Paste but not clear buffer
map("", "<leader>p", '"_dP')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map("n", "<C-t>", ":Term<CR>", { noremap = true }) -- open
map("t", "<Esc>", "<C-\\><C-n>") -- exit

-- NvimTree
map("n", "<C-n>", ":NvimTreeToggle<CR>") -- open/close
map("n", "<leader>f", ":NvimTreeRefresh<CR>") -- refresh
map("n", "<leader>n", ":NvimTreeFindFile<CR>") -- search file

-- Tagbar
map("n", "<leader>z", ":TagbarToggle<CR>") -- open/close

-- Telescope
function telescope(cmd)
	return "<cmd>lua require('telescope.builtin')." .. cmd .. "()<cr>"
end

map("n", "<leader>ff", telescope("find_files"))
map("n", "<leader>fg", telescope("live_grep"))
map("n", "<leader>fb", telescope("buffers"))

-- Lazygit
map("n", "<leader>gg", ":LazyGit<CR>")

-- Symbol Outline
map("n", "<leader>s", ":SymbolsOutline<CR>")

-- Comment
map("v", "<leader>c", ":'<,'>CommentToggle<CR>")
