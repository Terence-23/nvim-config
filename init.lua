local vim = vim
local Plug = vim.fn['plug#']

local config = vim.fn.stdpath('config')


-- plug config

vim.call('plug#begin')
Plug 'EdenEast/nightfox.nvim'
--   Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mbbill/undotree'
Plug 'williamboman/mason.nvim'

vim.call('plug#end')

vim.cmd('filetype plugin on')

require("mason").setup()

vim.opt.relativenumber = true
--vim.opt.noswapfile = true
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.wildmode = longest, list
vim.opt.clipboard = unnamedplus
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"

vim.cmd('source ' .. vim.fs.joinpath(config, 'custom/parentheses.vim'))

vim.cmd('source ' .. vim.fs.joinpath(config, 'lsp.lua'))

vim.cmd('source ' .. vim.fs.joinpath(config, 'nightfox.lua'))
