return {
    "voldikss/vim-floaterm",
    vim.keymap.set("n", "<C-g>", ":FloatermNew --height=0.9 --width=0.9 --wintype=float lazygit<CR>", {})
}
