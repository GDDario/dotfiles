return {
    { 
        "catppuccin/nvim", 
        name = "catppuccin",
        priority = 1000 
    },
    { 
        "datsfilipe/vesper.nvim", 
        name = "vesper", 
        priority = 1000,
        config = function()
            italics = {
                strings = false,
            	comments = true,
            }
	    vim.cmd.colorscheme "vesper"
        end
    }
}
