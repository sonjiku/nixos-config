return {
    -- LSP
    "folke/lazydev.nvim",
    { "j-hui/fidget.nvim",   tag = "legacy" },
    "RRethy/vim-illuminate",
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    {
        'dgagn/diagflow.nvim',
        event = 'LspAttach',
        opts = {}
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Reserve a space in the gutter
            -- This will avoid an annoying layout shift in the screen
            -- vim.opt.signcolumn = 'yes'

            -- Add cmp_nvim_lsp capabilities settings to lspconfig
            -- This should be executed before you configure any language server
            -- local lspconfig_defaults = require('lspconfig').util.default_config
            -- lspconfig_defaults.capabilities = vim.tbl_deep_extend(
            --     'force',
            --     lspconfig_defaults.capabilities,
            --     require('cmp_nvim_lsp').default_capabilities()
            -- )
            -- local capabilities = lspconfig_defaults.capabilities
            -- local lspcaps = capabilities

            -- This is where you enable features that only work
            -- if there is a language server active in the file
            -- vim.api.nvim_create_autocmd('LspAttach', {
            --     desc = 'LSP actions',
            --     callback = function(event)
            --     end,
            -- })

            -- Diagostic Maps
            local map = require("lib.key").map
            map("n", "<leader>do", "<cmd>lua vim.diagnostic.open_float()<cr>", "Open diagnositcs float")
            map("n", "<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Go to next diagnostic")
            map("n", "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<cr>", "Go to previous diagnostic")
            map("n", "<leader>dd", "<cmd>lua vim.diagnostic.setloclist()<cr>", "Print all diagnostics")
            map("n", "<leader>dt", "<cmd>Telescope diagnostics<cr>", "Print all diagnostics")

            -- This function gets run when an LSP connects to a particular buffer.
            local on_attach = function(client, bufnr)
                local lsp_map = require("lib.key").lsp_map

                -- lsp_map("K", vim.lsp.buf.hover(), event.buf, "Hover Documentation [LSP]")
                -- lsp_map("<leader>lm", vim.lsp.buf.hover(), event.buf, "Hover Documentation [LSP]")
                -- lsp_map("gd", vim.lsp.buf.definition(), event.buf, "Go to Definition [LSP]")
                -- lsp_map("gD", vim.lsp.buf.declaration(), event.buf, "Goto Declaration [LSP]")
                -- lsp_map("gi", vim.lsp.buf.implementation(), event.buf, "Go to Implementation [LSP]")
                -- lsp_map("go", vim.lsp.buf.type_definition(), event.buf, "Type definition [LSP]")
                -- lsp_map("gr", vim.lsp.buf.references(), event.buf, "References [LSP]")
                -- lsp_map("gs", vim.lsp.buf.signature_help(), event.buf, "Signature help [LSP]")
                -- lsp_map("<leader>ln", vim.lsp.buf.rename(), event.buf, "Rename [LSP]")
                -- lsp_map("<leader>lf", vim.lsp.buf.format({async=true}), event.buf, "Format [LSP]")
                -- lsp_map("<leader>la", vim.lsp.buf.code_action(), event.buf, "Code action [LSP]")
                -- lsp_map("<leader>lts", require("telescope.builtin").lsp_document_symbols(), event.buf,
                --     "Telescope doc symbols [LSP]")
                -- lsp_map("<leader>ltr", require("telescope.builtin").lsp_references(), event.buf, "Telescope References [LSP]")

                lsp_map("<leader>ln", vim.lsp.buf.rename, bufnr, "Rename [LSP]")
                lsp_map("<leader>la", vim.lsp.buf.code_action, bufnr, "Code action [LSP]")
                lsp_map("<leader>ld", vim.lsp.buf.type_definition, bufnr, "Type definition [LSP]")
                lsp_map("<leader>lf", vim.lsp.buf.format, bufnr, "Format [LSP]")
                lsp_map("<leader>ls", require("telescope.builtin").lsp_document_symbols, bufnr,
                    "Telescope doc symbols [LSP]")
                lsp_map("<leader>lr", require("telescope.builtin").lsp_references, bufnr, "Telescope References [LSP]")
                lsp_map("<leader>lm", vim.lsp.buf.hover, bufnr, "Hover Documentation [LSP]")
                lsp_map("<leader>lgd", vim.lsp.buf.definition, bufnr, "Go to Definition [LSP]")
                lsp_map("<leader>lgi", vim.lsp.buf.implementation, bufnr, "Go to Implementation [LSP]")
                lsp_map("<leader>lgD", vim.lsp.buf.declaration, bufnr, "Goto Declaration [LSP]")

                if client.name == 'ruff' then
                    -- Disable hover in favor of Pyright
                    client.server_capabilities.hoverProvider = false
                end

                -- Attach and configure vim-illuminate
                require("illuminate").on_attach(client)
            end

            -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
            local lspcaps = vim.lsp.protocol.make_client_capabilities()
            local capabilities = require("cmp_nvim_lsp").default_capabilities(lspcaps)
            local lspconfig = require("lspconfig")
            local lsputil = lspconfig.util


            -- nvim lua lsp
            -- require("neodev").setup()
            -- LSP eyecandy
            -- require("fidget").setup()
            -- Manual LSP
            lspconfig.nixd.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                cmd = { "nixd" },
                autostart = true,
                root_dir = lsputil.root_pattern("flake.nix", ".git"),
                settings = {
                    nixd = {
                        formatting = {
                            command = { "alejandra" },
                        },
                    },
                },
            }
            lspconfig.bashls.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                cmd = { "bash-language-server", "start" },
                filetypes = { "sh" },
                -- root_dir = util.find_git_ancestor
                single_file_support = true,
                settings = {
                    lua = {
                        -- bashIde = {
                        --     globPattern = "*@(.sh|.inc|.bash|.command)"
                        -- }
                    }
                }
            }
            lspconfig.ruff.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                trace = 'messages',
                init_options = {
                    -- cmd = { "ruff", "server" },
                    -- filetypes = { "python" },
                    -- single_file_support = true
                    settings = {
                        lineLength = 80,
                        exclude = { "**/tests/**" },
                        configurationPreference = "filesystemFirst",
                        -- logLevel = 'debug',
                        -- codeAction = {
                        -- disableRuleComment = {enable = false},
                        -- fixViolation = {enable = true}
                        -- },
                        lint = {
                            select = { "E", "F" },
                            ignore = {
                                "F401",
                                "E501",
                            }
                        },
                    }
                }
            }
            lspconfig.basedpyright.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                -- cmd = { },
                -- filetypes = { "python" },
                settings = {
                    basedpyright = {
                        analysis = {
                            autoSearchPaths = true,
                            diagnosticMode = "openFilesOnly",
                            useLibraryCodeForTypes = true,
                            -- -- Type Check Diagnostics
                            typeCheckingMode = "basic",
                            -- ignore = [],
                            -- -- Type Check Overrides
                            -- reportGeneralTypeIssues = false,
                            -- reportPropertyTypeMismatch = false,
                            -- reportFunctionMemberAccess = false,
                            -- reportMissingImports = false,
                            -- reportMissingModuleSource = false,
                            -- reportInvalidTypeForm = false,
                            -- reportMissingTypeStubs = false,
                            -- reportImportCycles = false,
                            reportUnusedImport = true,
                            -- reportUnusedClass = false,
                            -- reportUnusedFunction = false,
                            -- reportUnusedVariable = false,
                            -- reportDuplicateImport = false,
                            -- reportWildcardImportFromLibrary = false,
                            -- reportAbstractUsage = false,
                            -- reportArgumentType = false,
                            -- reportAssertTypeFailure = false,
                            -- reportAssignmentType = false,
                            -- reportAttributeAccessIssue = false,
                            -- reportCallIssue = false,
                            -- reportInconsistentOverload = false,
                            -- reportIndexIssue = false,
                            -- reportInvalidTypeArguments = false,
                            -- reportNoOverloadImplementation = false,
                            -- reportOperatorIssue = false,
                            -- reportOptionalSubscript = false,
                            -- reportOptionalMemberAccess = false,
                            -- reportOptionalCall = false,
                            -- reportOptionalIterable = false,
                            -- reportOptionalContextManager = false,
                            -- reportOptionalOperand = false,
                            -- reportRedeclaration = false,
                            -- reportReturnType = false,
                            -- reportTypedDictNotRequiredAccess = false,
                            -- reportUntypedFunctionDecorator = false,
                            -- reportUntypedClassDecorator = false,
                            -- reportUntypedBaseClass = false,
                            -- reportUntypedNamedTuple = false,
                            -- reportPrivateUsage = false,
                            -- reportTypeCommentUsage = false,
                            -- reportPrivateImportUsage = false,
                            -- reportConstantRedefinition = false,
                            -- reportDeprecated = false,
                            -- reportIncompatibleMethodOverride = false,
                            -- reportIncompatibleVariableOverride = false,
                            -- reportInconsistentConstructor = false,
                            -- reportOverlappingOverload = false,
                            -- reportPossiblyUnboundVariable = false,
                            -- reportMissingSuperCall = false,
                            -- reportUninitializedInstanceVariable = false,
                            -- reportInvalidStringEscapeSequence = false,
                            -- reportUnknownParameterType = false,
                            -- reportUnknownArgumentType = false,
                            -- reportUnknownLambdaType = false,
                            -- reportUnknownVariableType = false,
                            -- reportUnknownMemberType = false,
                            -- reportMissingParameterType = false,
                            -- reportMissingTypeArgument = false,
                            -- reportInvalidTypeVarUse = false,
                            -- reportCallInDefaultInitializer = false,
                            -- reportUnnecessaryIsInstance = false,
                            -- reportUnnecessaryCast = false,
                            -- reportUnnecessaryComparison = false,
                            -- reportUnnecessaryContains = false,
                            -- reportAssertAlwaysTrue = false,
                            -- reportSelfClsParameterName = false,
                            -- reportImplicitStringConcatenation = false,
                            -- reportUndefinedVariable = false,
                            -- reportUnboundVariable = false,
                            -- reportUnhashable = false,
                            -- reportInvalidStubStatement = false,
                            -- reportIncompleteStub = false,
                            -- reportUnsupportedDunderAll = false,
                            -- reportUnusedCallResult = false,
                            -- reportUnusedCoroutine = false,
                            -- reportUnusedExcept = false,
                            -- reportUnusedExpression = false,
                            -- reportUnnecessaryTypeIgnoreComment = false,
                            -- reportMatchNotExhaustive = false,
                            -- reportImplicitOverride = false,
                            -- reportShadowedImports = false,
                            -- BASED
                            -- reportUnreachable = false,
                            -- reportAny = false,
                            -- reportIgnoreCommentWithoutRule = false,
                            -- reportPrivateLocalImportUsage = false,
                            -- reportImplicitRelativeImport = false,
                            -- reportInvalidCast = false,
                            -- reportUnsafeMultipleInheritance = false,
                            -- reportUnusedParameter = false,
                        }
                    }
                },
                -- single_file_support = true
            }
            -- Lua
            lspconfig.lua_ls.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        cmd = { "lua-language-server" },
                        filetype = { "lua" },
                        log_level = 2,
                        -- root_dir = lsputil.root_pattern(".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git"),
                        single_file_support = true,
                        diagnostics = {
                            globals = { 'vim' }
                        },
                        runtime = {
                            version = "LuaJIT",
                            path = { "lua/?.lua", "lua/?/init.lua" },
                        },
                        workspace = {
                            checkThirdParty = false,
                            library = { "$VIMRUNTIME" },

                        }
                    }
                }
            }
            -- Set up cool signs for diagnostics
            local diag_signs = { Error = "e ", Warn = "! ", Hint = "? ", Info = "i " }
            -- local hl = "DiagnosticSign" .. type
            -- vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })


            -- Diagnostic config
            vim.diagnostic.config({
                signs = {
                    active = diag_signs,
                },
                virtual_text = false,
                -- virtual_text = {
                --     prefix =  '●',
                --     severity = {
                --         vim.diagnostic.severity.WARN,
                --         vim.diagnostic.severity.ERROR,
                --     }
                -- },
                float = {
                    focusable = true,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
                update_in_insert = true,
                underline = true,
                severity_sort = true,
            })
        end,
    },
    -- Null-LS
    -- {
    --     "jose-elias-alvarez/null-ls.nvim",
    --     config = function()
    --         require("null-ls").setup({
    --             sources = {
    --                 -- Anything not supported by mason.
    --             },
    --         })
    --     end,
    -- },
    -- Nu language
    {
        "LhKipp/nvim-nu",
        dependencies = {
            "jose-elias-alvarez/null-ls.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require 'nu'.setup {
                use_lsp_features = true, -- requires https://github.com/jose-elias-alvarez/null-ls.nvim
                -- lsp_feature: all_cmd_names is the source for the cmd name completion.
                -- It can be
                --  * a string, which is evaluated by nushell and the returned list is the source for completions (requires plenary.nvim)
                --  * a list, which is the direct source for completions (e.G. all_cmd_names = {"echo", "to csv", ...})
                --  * a function, returning a list of strings and the return value is used as the source for completions
                all_cmd_names = [[help commands | get name | str join "\n"]]
            }
        end,
    },
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },
    "rcarriga/nvim-notify",
}
