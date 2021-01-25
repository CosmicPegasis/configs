let mapleader=" "

call plug#begin('~/.vim/plugged')
"========================================================================================================================================================================================
" General
"----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Plug 'scrooloose/nerdtree'                                                                  "File Explorer 
Plug 'jiangmiao/auto-pairs'                                                                 "Auto Pairing Brackets
Plug 'wfxr/minimap.vim'                                                                     "Minimap
Plug 'tpope/vim-fugitive'                                                                   "Git Integration
Plug 'airblade/vim-gitgutter'                                                               "Git Diff Integration
Plug 'vim-airline/vim-airline'                                                              "Status Bar
Plug 'rafi/awesome-vim-colorschemes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }                                         "Fuzzy Search
Plug 'junegunn/fzf.vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }                                        "Material Theme
Plug 'neoclide/coc.nvim', {'branch': 'release'}                                             "Autcomplete
Plug 'vim-ctrlspace/vim-ctrlspace'                                                          "Workspace Management

"----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
" Python
"----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }                    "Python Integration and IDE Features
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}                                      "Semantic Highlighting for Python

"----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
" HTML and CSS
"----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Plug 'mattn/emmet-vim'                                                                      "Easier HTML and CSS
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }                                      "Prettier for HTML and CSS
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}                             "Live Preview 

"----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
" C++
"----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Plug 'dense-analysis/ale'                                                                   "Linting for C++
Plug 'jackguo380/vim-lsp-cxx-highlight'                                                     "Semantic Highliting for C++
"========================================================================================================================================================================================
call plug#end()

let g:material_theme_style = 'ocean-community'

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Python-mode
let g:pymode = 1
let g:pymode_python = 'python3'
let g:pymode_run_bind = '<F5>'
let g:pymode_indent = 1

" Coc config
let g:coc_global_extensions = ['coc-python']

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" Emmet Configuration
let g:user_emmet_mode='a'
let g:user_emmet_install_global = 0
autocmd FileType html EmmetInstall
let g:user_emmet_leader_key=','

" Prettier for vim configuration
let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 0
let g:prettier#autoformat_require_pragma = 0

augroup VimPrettier
    autocmd!
    autocmd BufWritePre *.js,*.ts,*.html,*.css Prettier
augroup END

" Ale Config
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
let g:ale_fix_on_save = 1
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql PrettierAsync

let g:ale_fixers = {
            \ 'cpp': ['astyle']
            \}

" C++ Semantic Highlisting Config
let g:lsp_cxx_hl_use_text_props = 1

" CtrlSpace
let g:CtrlSpaceDefaultMappingKey = "<C-space> "

" Custom Keybinds
nnoremap " :NERDTreeToggle<CR>
nnoremap gs :source %<CR>
nnoremap <leader>f :Files ~<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap gnv :vsplit 
nnoremap gnt :tabedit
nnoremap <leader>cd :cd %:p:h<CR>
nnoremap <leader>tt :tabedit<CR>:terminal<CR>
nnoremap <leader>tn :tabedit<CR>:terminal<CR>annn<CR>

" Terminal keybindings
tnoremap <leader>jj <C-\><C-n>
" Closing Windows
nnoremap gcj <c-w>j:q<CR>
nnoremap gck <c-w>k:q<CR>
nnoremap gcl <c-w>l:q<CR>
nnoremap gch <c-w>h:q<CR>
nnoremap gj <c-w>j<CR>
nnoremap gk <c-w>k
nnoremap gl <c-w>l
nnoremap gh <c-w>h

nnoremap <leader>l :PymodeLint<CR>
nnoremap <leader>L :PymodeLintAuto<CR>

" Git keybindings
nnoremap <leader>Gs :tab Git status<CR>
nnoremap <leader>Gc :Git commit
nnoremap <leader>Ga :Git add
nnoremap <leader>Gd :tab Git diff<CR>
nnoremap <leader>Gg :tab Git<CR>
nnoremap <leader>Gp :Git push origin master<CR>

" Vim settings
colorscheme material

set relativenumber                          " show line numbers
set termguicolors
set number
set nocompatible
set hidden
set encoding=utf-8
set ruler
set ttyfast                                 " terminal acceleration
set tabstop=4                               " 4 whitespaces for tabs visual presentation
set shiftwidth=4                            " shift lines by 4 spaces
set smarttab                                " set tabs for a shifttabs logic
set expandtab                               " expand tabs into spaces
set autoindent                              " indent when moving to the next line while writing code
set cursorline                              " shows line under the cursor's line
set showmatch                               " shows matching part of bracket pairs (), [], {}
set enc=utf-8	                            " utf-8 by default
set nobackup 	                            " no backup files
set nowritebackup                           " only in case you don't want a backup file while editing
set noswapfile 	                            " no swap files
set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?
set scrolloff=10                            " let 10 lines before/after cursor during scroll
set clipboard+=unnamed                       " use system clipboard
set exrc                                    " enable usage of additional .vimrc files from working directory set secure                                  " prohibit .vimrc files to execute shell, create files, etc...
syntax on
set mouse=a

inoremap jj <Esc>
inoremap jk <Esc>
vnoremap  <leader>y  "+y

set incsearch	                            " incremental search
set hlsearch	                            " highlight search results

:cd %:p:h
