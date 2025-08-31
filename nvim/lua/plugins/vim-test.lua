return {
    "vim-test/vim-test",
    dependencies = {
        "voldikss/vim-floaterm",
    },
    config = function()
        vim.g["test#custom_strategies"] = {
            floaterm = function(cmd)
                vim.cmd("FloatermNew --height=0.9 --width=0.9 --wintype=float " .. cmd)
            end,
        }
        vim.g["test#strategy"] = "floaterm"

        vim.keymap.set("n", "<C-t>", ":TestNearest<CR>", {})
        vim.keymap.set("n", "<C-T>", ":TestFile<CR>", {})
        vim.keymap.set("n", "<C-a>", ":TestSuite<CR>", {})
        vim.keymap.set("n", "<C-l>", ":TestLast<CR>", {})
    end,
}

