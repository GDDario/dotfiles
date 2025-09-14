return {
    "voldikss/vim-floaterm",
    vim.keymap.set("n", "<C-g>", function()
        local dir = vim.fn.expand("%:p:h")
        vim.cmd("FloatermNew --height=0.9 --width=0.9 --wintype=float cd " .. dir .. " && lazygit")
    end, {}),
    -- vim.keymap.set("n", "<C-d>", ":FloatermNew --height=0.9 --width=0.9 --wintype=float lazydocker<CR>", {}),
}
