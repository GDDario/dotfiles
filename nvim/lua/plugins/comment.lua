return {
    "numtostr/comment.nvim",
    opts = {},
    config = function(_, opts)
        local comment = require("Comment")
        comment.setup(opts)

        vim.keymap.set("n", "<C-_>", "<Plug>(comment_toggle_linewise_current)", { noremap = false, silent = true })

        vim.keymap.set("x", "<C-_>", "<Plug>(comment_toggle_linewise_visual)", { noremap = false, silent = true })
    end,
}
