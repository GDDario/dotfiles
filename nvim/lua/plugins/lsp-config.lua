return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "ts_ls", "intelephense", "laravel_ls", "angularls" },
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.keymap.set("n", "K", function()
				local clients = vim.lsp.get_active_clients({ bufnr = 0 })
				for _, client in ipairs(clients) do
					if client.server_capabilities.hoverProvider then
						vim.lsp.buf.hover({ client_id = client.id })
						break
					end
				end
			end, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

			local on_attach = function(client, bufnr) end

			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							telemetry = { enable = false },
						},
					},
				},
				ts_ls = {},
				angularls = {},
				laravel_ls = {},
				intelephense = {
					commands = {
						IntelephenseIndex = {
							function()
								vim.lsp.buf.execute_command({ command = "intelephense.index.workspace" })
							end,
						},
					},
					settings = {
						intelephense = {
							environment = {
								includePaths = { "./vendor" },
							},
						},
					},
				},
			}

			for server, config in pairs(servers) do
				config.capabilities = capabilities
				config.on_attach = on_attach
				lspconfig[server].setup(config)
			end

			vim.diagnostic.config({ virtual_text = true })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
