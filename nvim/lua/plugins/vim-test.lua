return {
    "vim-test/vim-test",
    dependencies = {
        "voldikss/vim-floaterm",
    },
    config = function()
        vim.g.floaterm_autoinsert = 1
        vim.g.floaterm_autoclose = 0

        vim.g["test#custom_strategies"] = {
            floaterm = function(cmd)
                vim.cmd("FloatermNew --autoclose=0 --height=0.9 --width=0.9 --wintype=float " .. cmd)
            end,
        }
        vim.g["test#strategy"] = "floaterm"

        vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", {})
        vim.keymap.set("n", "<leader>T", ":TestFile<CR>", {})
        vim.keymap.set("n", "<leader>a", ":TestSuite<CR>", {})
        vim.keymap.set("n", "<leader>l", ":TestLast<CR>", {})
    end,
}

