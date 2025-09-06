return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "ts_ls", "intelephense", "angularls" },
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
                if vim.bo.filetype == "php" then
                    local clients = vim.lsp.get_active_clients({ bufnr = 0, name = "intelephense" })
                    if #clients > 0 and clients[1].server_capabilities.hoverProvider then
                        vim.lsp.buf.hover({ client_id = clients[1].id })
                        return
                    end
                end
                vim.lsp.buf.hover()
            end, { desc = "Hover documentation" })
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

            local function get_root_dir(filetype, patterns)
                return function(fname)
                    local util = require("lspconfig.util")
                    local roots = util.find_git_ancestor(fname) or util.root_pattern(unpack(patterns))(fname)
                    return roots or util.path.dirname(fname)
                end
            end

            local function prevent_duplicate_intelephense()
                return function()
                    local clients = vim.lsp.get_active_clients({ name = "intelephense" })
                    return #clients > 0 and "stop" or nil
                end
            end

            local on_attach = function(_, _) end

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
                intelephense = {
                    root_dir = get_root_dir("php", { "composer.json", ".git" }),
                    single_file_support = false,
                    on_new_config = prevent_duplicate_intelephense(),
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
                            diagnostics = {
                                enable = true,
                            },
                            completion = {
                                enable = true,
                                triggerParameterHints = true,
                                maxItems = 100,
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
