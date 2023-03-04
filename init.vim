"plugin config
call plug#begin()

 Plug 'prabirshrestha/vim-lsp'

 Plug 'Shougo/deoplete.nvim'
 Plug 'lighttiger2505/deoplete-vim-lsp'

 Plug 'dracula/vim'
 Plug 'ryanoasis/vim-devicons'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(
      \   lsp#utils#find_nearest_parent_file_directory(
      \     lsp#utils#get_buffer_path(), ['.ccls', 'compile_commands.json', '.git/']))},
      \ 'initialization_options': {
      \   'highlight': { 'lsRanges' : v:true },
      \   'cache': {'directory': stdpath('cache') . '/ccls' },
      \ },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif


filetype plugin indent on
filetype plugin on
syntax on

" key remaps

inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

" set
set number 
set noswapfile 
set hlsearch 
set ignorecase 
set incsearch
set expandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4
set wildmode=longest,list
set clipboard=unnamedplus


"coc.nvim settings
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0

source $HOME/.config/nvim/custom/coc.vim

