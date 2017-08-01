call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"current theme
Plug 'sjl/badwolf'

"'sensible' defaults
Plug 'tpope/vim-sensible'

"code helpers
Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}

"text manipulation
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'godlygeek/tabular'

"search
Plug 'scrooloose/nerdtree'
Plug 'kshenoy/vim-signature'

"syntax highlight and colors
Plug 'fleischie/vim-styled-components'
Plug 'hail2u/vim-css3-syntax'
Plug 'iCyMind/NeoSolarized'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'lunaru/vim-twig'
Plug 'gregsexton/matchtag'
Plug 'plasticboy/vim-markdown'
Plug 'rodjek/vim-puppet'
Plug 'othree/html5.vim'
Plug 'StanAngeloff/php.vim'
Plug 'fatih/vim-go'


"git integration
"Plug 'tpope/vim-fugitive'
"Plug 'airblade/vim-gitgutter'

call plug#end()

" -------------------------------------------------
"  important
" -------------------------------------------------
"Who cares about vi compatability
set nocompatible

" -------------------------------------------------
"  moving around, searching and patterns
" -------------------------------------------------
"Ignore case in search mode
set ignorecase

"Do not ignore uppercase
set smartcase

"highlight search resules
set hlsearch

" -------------------------------------------------
"  tags
" -------------------------------------------------

" -------------------------------------------------
"  displaying text
" -------------------------------------------------



" -------------------------------------------------
"  syntax, highlighting and spelling
" -------------------------------------------------
"Enable Syntax Highlighting
syntax on
colorscheme badwolf 
set background=dark

"show tabs and trailing spaces
set list listchars=tab:»·,trail:·
augroup ft_go
    au!

    au Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
    au Filetype go setlocal listchars+=tab:\ \ 
augroup END

let g:ale_fixers = {
\   'javascript': [
\      'eslint',
\   ]
\}
let g:ale_fix_on_save = 1

let g:ale_linters = {
\   'go': [
\       'go build'
\   ]
\}


" -------------------------------------------------
"  autocompletion
" -------------------------------------------------
let g:deoplete#sources#go#gocode_binary = '/home/vagrant/go/bin/gocode'
let g:deoplete#sources#go#use_cache = '~/.cache/deoplete/go/$GOOS_$GOARCH'
let g:deoplete#enable_at_startup = 1

" -------------------------------------------------
"  git integration
" -------------------------------------------------
"let g:gitgutter_override_sign_column_highlight = 0

" -------------------------------------------------
"  multiple tab pages
" -------------------------------------------------
map <c-t> :tabnew<CR>

" -------------------------------------------------
"  terminal
" -------------------------------------------------
set ttyfast

" -------------------------------------------------
"  hiding status bar 
" -------------------------------------------------
set laststatus=0
set noshowmode
set noruler
set noshowcmd

let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction

nnoremap <S-h> :call ToggleHiddenAll()<CR>


" -------------------------------------------------
"  using the mouse
" -------------------------------------------------
set mouse=



" -------------------------------------------------
"  printing
" -------------------------------------------------

" -------------------------------------------------
"  messages and info
" -------------------------------------------------

" -------------------------------------------------
"  selecting text
" -------------------------------------------------

" -------------------------------------------------
"  editing text
" -------------------------------------------------
set formatoptions+=j

" -------------------------------------------------
"  tabs and indenting
" -------------------------------------------------
set tabstop=4
"Spaces not tabs
set shiftwidth=4
"Change existing tabs to spaces
set expandtab

" -------------------------------------------------
"  folding
" -------------------------------------------------
set nofoldenable

" -------------------------------------------------
"  diff mode
" -------------------------------------------------
" start diff mode with vertical splits by default
set diffopt+=vertical

" -------------------------------------------------
"  mapping
" -------------------------------------------------
"NERDTree mapping
map <C-n> :NERDTreeToggle<CR>
"command to add doc blocks
autocmd FileType php noremap <TAB> <ESC>:call pdv#DocumentWithSnip()<CR>

" -------------------------------------------------
"  reading and writing files
" -------------------------------------------------
"Dont ask for confirmation on save
set autowrite
"Hides current buffer when new buffer is open
set hidden

" -------------------------------------------------
"  the swap file
" -------------------------------------------------

" -------------------------------------------------
"  command line editing
" -------------------------------------------------

" -------------------------------------------------
"  executing external commands
" -------------------------------------------------

" -------------------------------------------------
"  running make and jumping to errors
" -------------------------------------------------

" -------------------------------------------------
"  language specific
" -------------------------------------------------
"Detect Syntax settings
filetype plugin indent on

"Auto import go paths
let g:go_fmt_command = "goimports"

"map <leader>(gd) to godocumentation
au FileType go nmap <Leader>gd <Plug>(go-doc)


" -------------------------------------------------
"  multi-byte characters
" -------------------------------------------------

" -------------------------------------------------
"  various
" -------------------------------------------------
"Show numbers in the gutter
set number
"column to display the limit row
set colorcolumn=80
