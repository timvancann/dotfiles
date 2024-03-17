vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- open file tree

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move selection up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move selection down

vim.keymap.set("n", "J", "mzJ`z") -- curser stays after line join
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- center screen after jumping
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- center screen after jumping
vim.keymap.set("n", "n", "nzzzv") -- center the screen after jumping
vim.keymap.set("n", "N", "Nzzzv") -- center the screen after jumping
vim.keymap.set("n", "<C-]>", "<C-]>zz") -- move selection up
vim.keymap.set("n", "<C-o>", "<C-o>zz") -- move selection down

vim.keymap.set("x", "<leader>p", "\"_dP") -- paste without copy
vim.keymap.set("n", "<leader>q", "<cmd>ccl<CR>") -- close quickfix

vim.keymap.set("n", "<leader>y", "\"+y") -- copy to system clipboard
vim.keymap.set("v", "<leader>y", "\"+y") -- copy to system clipboard
vim.keymap.set("n", "<leader>Y", "\"+y") -- copy to system clipboard

vim.keymap.set("n", "Q", "<nop>") -- evil

vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz") -- next in diagnostic list
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz") -- previous in diagnostic list
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz") -- next in location list
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz") -- previous in location list

vim.keymap.set('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>') -- open diagnostic float

vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left toggle=true<CR>") -- open file tree

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle) -- open undo tree

vim.keymap.set("n", "<leader>gg", vim.cmd.LazyGit) -- open lazygit

vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>") -- open terminal

-- rust
vim.keymap.set("n", "<leader>rr", ":RustLsp runnables<CR>") -- runnables


vim.keymap.set("i", "<Esc>", "<Esc>:w<CR>") -- exit normal mode and save
