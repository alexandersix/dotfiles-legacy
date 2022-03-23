" nvim-lspconfig
" - Allows configuring of LSP servers
Plug 'neovim/nvim-lspconfig'

" nvim-lsp-installer
" - Simplifies the LSP server install process
Plug 'williamboman/nvim-lsp-installer'

" cmp plugins
" - Completion engine (and helper plugins)
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'onsails/lspkind-nvim'

function LspSetup()
lua << EOF
local set = vim.g
local map = vim.api.nvim_buf_set_keymap
local options = { noremap = true, silent = true }
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local general_keybindings = function (bufnr)
    map(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', options)
    map(bufnr, 'n', '<leader>cd', '<cmd>lua vim.lsp.buf.definition()<CR>', options)
    map(bufnr, 'n', '<leader>ct', '<cmd>lua vim.lsp.buf.type_definition()<CR>', options)
    map(bufnr, 'n', '<leader>ci', '<cmd>lua vim.lsp.buf.implementation()<CR>', options)
    map(bufnr, 'n', '<leader>cr', '<cmd>lua vim.lsp.buf.references()<CR>', options)
    map(bufnr, 'n', '<leader>crn', '<cmd>lua vim.lsp.buf.rename()<CR>', options)
    map(bufnr, 'n', '<leader>caa', '<cmd>lua vim.lsp.buf.code_action()<CR>', options)

    map(bufnr, 'n', '<leader>dj', '<cmd>lua vim.diagnostic.goto_next()<CR>', options)
    map(bufnr, 'n', '<leader>dk', '<cmd>lua vim.diagnostic.goto_prev()<CR>', options)
    map(bufnr, 'n', '<leader>dl', '<cmd>Telescope diagnostics<CR>', options)
end

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    if server.name == "cssls" then
        opts.on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false

            general_keybindings(bufnr)

            set.tabstop = 2
            set.softtabstop = 2
            set.shiftwidth = 2
        end
    end

    -- (optional) Customize the options passed to the server
    if server.name == "intelephense" then
        opts.on_attach = function(client, bufnr)
            general_keybindings(bufnr)

            set.tabstop = 4
            set.softtabstop = 4
            set.shiftwidth = 4
        end
    end

    if server.name == "sumneko_lua" then
        opts.on_attach = function(client, bufnr)
            general_keybindings(bufnr)

            set.tabstop = 4
            set.softtabstop = 4
            set.shiftwidth = 4
        end
    end

    if server.name == "gopls" then
        opts.on_attach = function(client, bufnr)
            general_keybindings(bufnr)
        end
    end

    if server.name == "clangd" then
        opts.on_attach = function(client, bufnr)
            general_keybindings(bufnr)
        end
    end

    if server.name == "tsserver" then
        opts.on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false

            general_keybindings(bufnr)

            set.tabstop = 2
            set.softtabstop = 2
            set.shiftwidth = 2

            local ts_utils = require("nvim-lsp-ts-utils")
            ts_utils.setup({})
            ts_utils.setup_client(client)
        end
    end

    if server.name == "svelte" then
        opts.on_attach = function(client, bufnr)
            general_keybindings(bufnr)

            set.tabstop = 2
            set.softtabstop = 2
            set.shiftwidth = 2
        end
    end
    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.formatting.prettier
    },
    on_attach = function(client, bufnr)
        general_keybindings(bufnr)

        if client.resolved_capabilities.document_formatting then
            vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
        end
    end,
})

-- Setup nvim-cmp.
vim.opt.completeopt={'menu','menuone','noselect'}

local cmp = require'cmp'
local lspkind = require('lspkind')
local source_mapping = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    cmp_tabnine = "[TN]",
    path = "[Path]",
}

cmp.setup({
    snippet = {
        expand = function(args)
            require('ultisnips').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'ultisnips' }, -- For ultisnips users.
    }, {
        { name = 'buffer' },
        { name = 'cmp_tabnine' },
    }),
    formatting = {
        format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind]
			local menu = source_mapping[entry.source.name]
			if entry.source.name == 'cmp_tabnine' then
				if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
					menu = entry.completion_item.data.detail .. ' ' .. menu
				end
				vim_item.kind = ''
			end
			vim_item.menu = menu
			return vim_item
		end
    }
})
EOF
endfunction

augroup LspSetup
    autocmd!
    autocmd User PlugLoaded call LspSetup()
augroup END
