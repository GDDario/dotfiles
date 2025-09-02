return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{
		"datsfilipe/vesper.nvim",
		name = "vesper",
		priority = 1000,
		opts = {
			italics = {
				strings = false,
				comments = true,
			},
		},
		config = function(_, opts)
			require("vesper").setup(opts)
			vim.cmd.colorscheme("vesper")
		end,
	},
}
