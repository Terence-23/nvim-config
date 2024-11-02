local lsp_bin = vim.fs.joinpath(vim.fn.stdpath('data'), 'mason/bin/')
-- cpp
vim.api.nvim_create_autocmd('FileType', {
    pattern = "cpp",
    callback = function(args)
        vim.opt.softtabstop = 2
        vim.opt.shiftwidth = 2
        vim.opt.tabstop = 2
        vim.lsp.start({
            name = 'clangd',
            cmd = { vim.fs.joinpath(lsp_bin, 'clangd') },
            root_dir = vim.fs.dirname(vim.fn.expand('%:p')),
        })
    end,
})

--rust
vim.api.nvim_create_autocmd('FileType', {
    pattern = "rust",
    callback = function(args)
        vim.lsp.start({
            name = 'rust-analyzer',
            cmd = { vim.fs.joinpath(lsp_bin, 'rust-analyzer') },
            root_dir = vim.fs.root(args.buf, { 'cargo.toml' }),
        })
    end,
})


--go
vim.api.nvim_create_autocmd('FileType', {
    pattern = "go",
    callback = function(args)
        vim.lsp.start({
            name = 'gopls',
            cmd = { vim.fs.joinpath(lsp_bin, 'gopls') },
            root_dir = vim.fs.root(args.buf, { 'go.mod', }),
        })
    end,
})


--lua
vim.api.nvim_create_autocmd('FileType', {
    pattern = "lua",
    callback = function(args)
        vim.lsp.start({
            name = 'lua-language-server',
            cmd = { vim.fs.joinpath(lsp_bin, 'lua-language-server') },
            root_dir = vim.fs.dirname(vim.fn.expand('%:p')),
        })
    end,
})


-- set autoformat
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.supports_method('textDocument/implementation') then
            local bufmap = function(mode, lhs, rhs)
                local opts = { buffer = args.buf }
                vim.keymap.set(mode, lhs, rhs, opts)
            end
            -- Create a keymap for vim.lsp.buf.implementation
            bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
            -- Jump to the definition
            bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

            -- Jump to declaration
            bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

            -- Lists all the implementations for the symbol under the cursor
            bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

            -- Jumps to the definition of the type symbol
            bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

            -- Lists all the references
            bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
            --rename references
            bufmap('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<cr>')
            --format
            bufmap('n', 'gf', '<cmd>lua vim.lsp.buf.format()<cr>')

            -- trigger completion
            bufmap('i', '<C-Space>', '<C-x><C-o>')
            -- code actions
            bufmap('n', '<C-.>', '<cmd> lua vim.lsp.buf.code_action()<cr>')
        end
        if client.supports_method('textDocument/completion') then
            -- Enable auto-completion

            -- vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end
        if client.supports_method('textDocument/formatting') then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                end,
            })
        end
    end,
})
