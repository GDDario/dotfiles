return {
	{
		"rmagatti/auto-session",
		lazy = true,
		config = function()
			vim.o.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,winpos,localoptions"

			require("auto-session").setup({
				log_level = "info",
				auto_session_enable_last_session = false,
				auto_session_create_enabled = true,
			})
		end,
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			local default_config = dashboard.config

			dashboard.section.buttons.val = {
				dashboard.button("e", "  New file", ":ene <CR>"),
				dashboard.button("f f", "󰈞  Find file", ":Telescope find_files<CR>"),
				dashboard.button("f h", "󰊄  Recently opened files", ":Telescope oldfiles<CR>"),
				dashboard.button("f r", "  Frecency/MRU", ":Telescope frecency<CR>"),
				dashboard.button("f g", "󰈬  Find word", ":Telescope live_grep<CR>"),
				dashboard.button("f m", "  Jump to bookmarks", ":Telescope marks<CR>"),
				dashboard.button("s l", "  Open last session", function()
					require("auto-session").RestoreSession()
				end),
			}

			alpha.setup(default_config)
		end,
	},
}
