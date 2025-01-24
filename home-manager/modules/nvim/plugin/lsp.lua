local on_attach = function(_, bufnr)
        local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

    bufmap('<leader>r', vim.lsp.buf.rename)
    bufmap('<leader>a', vim.lsp.buf.code_action)

    bufmap('gd', vim.lsp.buf.definition, '[Goto] [D]efinition')
    bufmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    bufmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    bufmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
    bufmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    bufmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    bufmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
    bufmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    bufmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    bufmap('K', vim.lsp.buf.hover, 'Hover Documentation')

    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('neodev').setup()
require('lspconfig').lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = function()
        return vim.loop.cwd()
    end,
    settings = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    }
}

require('lspconfig').nixd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = event.buf,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = event.buf,
                callback = vim.lsp.buf.clear_references,
            })
        end
    end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

local servers = {
    clangd = {
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    },
    gopls = {
        gofumt = true,
    },
    rust_analyzer = {},
    pyright = {},
    eslint = {},
    astro = {},
    bashls = {},
    cssls = {},
    docker_compose_language_service = {},
    html = {},
    jsonls = {},
    tailwindcss = {
        root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
        end,
    },
    ts_ls = {
        root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
        end,
        single_file_support = false,
        settings = {
            typescript = {
                inlayHints = {
                    includeInlayParameterNameHints = "literal",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = false,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
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
                    includeInlayEnumMemberValueHints = true,
                },
            },
        },
    },
}

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
    'stylua',
    'gopls',
    "typescript-language-server",
    'css-lsp',
    'tailwindcss-language-server',
})
require('mason-tool-installer').setup { ensure_installed = ensure_installed }

require('mason-lspconfig').setup {
    handlers = {
        function(server_name)
            local server = servers[server_name] or {}
            require('lspconfig')[server_name].setup {
                cmd = server.cmd,
                settings = server.settings,
                filetypes = server.filetypes,
                capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {}),
            }
        end,
    },
}

