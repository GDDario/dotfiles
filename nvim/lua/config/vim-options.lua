vim.g.mapleader = " "

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.keymap.set("n",    "<Tab>",         ">>",  opts)
vim.keymap.set("n",    "<S-Tab>",       "<<",  opts)
vim.keymap.set("v",    "<Tab>",         ">gv", opts)
vim.keymap.set("v",    "<S-Tab>",       "<gv", opts)

--vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
--vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
--vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
--vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.opt.number = true
vim.opt.relativenumber = true
