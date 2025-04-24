-- Reserve a space in the gutter
vim.opt.signcolumn = 'yes'

-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        'lua_ls',
        'vimls',
        'jsonls',
        'html',
        'emmet_ls',
        'cssls',
        'tailwindcss',
        'ts_ls',
        'rust_analyzer',
        'eslint',
    },
    automatic_installation = true,
})

-- LSP server configurations
local lspconfig = require("lspconfig")

-- Add to the top of your LSP config file
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- TypeScript setup
lspconfig.ts_ls.setup({
    capabilities = capabilities,
    settings = {
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
            },
        },
        javascript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
            },
        },
    },
})

-- ESLint setup
lspconfig.eslint.setup({
    capabilities = capabilities,
    -- Enable ESLint formatting
    on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
        })
    end,
})

-- Tailwind CSS setup (if you're using it)
lspconfig.tailwindcss.setup({
    capabilities = capabilities,
    settings = {
        tailwindCSS = {
            experimental = {
                classRegex = {
                    "tw`([^`]*)",
                    "tw\\.[^`]+`([^`]*)",
                    "tw\\(.*?\\).*?`([^`]*)",
                    "className=['\"]([^'\"]*)",
                    "className:\\s+['\"]([^'\"]*)",
                },
            },
            includeLanguages = {
                typescript = "javascript",
                typescriptreact = "javascript",
            },
        },
    },
})

-- Rust setup
lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            },
            checkOnSave = {
                command = "clippy",
            },
            inlayHints = {
                bindingModeHints = {
                    enable = true,
                },
                closureReturnTypeHints = {
                    enable = "always",
                },
            },
        },
    },
})

-- Lua (for your Neovim config files)
lspconfig.lua_ls.setup({
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

lspconfig.vimls.setup({
    capabilities = capabilities,
})

lspconfig.jsonls.setup({
    capabilities = capabilities,
})

lspconfig.cssls.setup({
    capabilities = capabilities,
})

lspconfig.html.setup({
    capabilities = capabilities,
})

lspconfig.emmet_ls.setup({
    capabilities = capabilities,
})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

        -- Custom keymaps
        vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set('n', '<leader>[d', function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
        vim.keymap.set('n', '<leader>]d', function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
    end,
})
