call plug#begin('~/.local/shar/nvim/plugged')

"themes
" Plug 'morhetz/gruvbox'
" Plug 'ayu-theme/ayu-vim'
"Plug 'joshdick/onedark.vim'
Plug 'crusoexia/vim-monokai'
Plug 'kaicataldo/material.vim', { 'branch': 'main' } 
"visual
Plug 'yggdroot/indentline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'lilydjwg/colorizer'
Plug 'leafgarland/typescript-vim'
Plug 'uiiaoo/java-syntax.vim'

"Git integration
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

"Functionality
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'KabbAmine/vCoolor.vim'
Plug 'easymotion/vim-easymotion'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'vim-python/python-syntax'
"Plug 'vim-scripts/taglist.vim'
Plug 'stanangeloff/php.vim'
Plug 'shawncplus/phpcomplete.vim'
Plug 'noahfrederick/vim-laravel'
Plug 'pbrisbin/vim-mkdir'

"code modification
Plug 'scrooloose/nerdcommenter'
Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rhysd/vim-clang-format'

call plug#end()

syntax on
set mouse=a
set noerrorbells
set sw=2
set expandtab
set smartindent
set numberwidth=1
set number
set rnu
set noswapfile
set incsearch
set clipboard=unnamedplus
set encoding=utf-8
set ignorecase
set cursorline
set splitbelow
set splitright
"set guicursor=i:ver25-iCursor

"set colorcolumn=120

"highlight ColoColumn ctermbg=0 guibg=lightgrey

let g:python3_host_prog = '/usr/bin/python3'

let mapleader = " "

"Theme
if (has('termguicolors'))
  set termguicolors
endif

"let g:python_highlight_all = 1
let g:material_theme_style = 'ocean'
"set termguicolors
"set background=dark
" let ayucolor="dark"
" let g:gruvbox_contrast_dark="hard"
" let g:despacio_Sunset = 1
let g:despacio_Twilight = 1
" let g:despacio_Midnight = 1
" let g:despacio_Pitch = 1
colorscheme material

nmap <F5> :source ~/.config/nvim/init.vim<CR>
vmap <F5> :source ~/.config/nvim/init.vim<CR>

nnoremap <leader>w :w<CR>
nnoremap <leader>e :e $MYVIMRC<CR>

vnoremap <c-t> :split<CR>:ter<CR>:resize 15<CR>
nnoremap <c-t> :split<CR>:ter<CR>:resize 15<CR>

" Moverse al buffer siguiente con <líder> + k
nnoremap <leader>k :bnext<CR>

" Moverse al buffer anterior con <líder> + j
nnoremap <leader>j :bprevious<CR>

" Cerrar el buffer actual con <líder> + q
nnoremap <leader>q :bdelete<CR>

"crear una nueva ventana
nnoremap <leader>t :tabe<CR>

"hacer un split vertical
nnoremap <leader>vs :vsp<CR>

"hacer un split horizontal
nnoremap <leader>sp :sp<CR>

"Configuration of FZF
let g:fzf_preview_window = 'right:40%'
nnoremap <c-p> :Files<CR>
nnoremap <c-g> :GitFiles<CR>
" use current git repo/file director with ctrl p
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_use_caching = 0

"NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"Mapeo del explorador de archivos
let g:NERDTreeChDirMode = 2 "Cambia el directorio actual al nodo padre actual
map <space>. :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Vim devicons
if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

"Mapeo de la barra de estado airline
let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)
let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo
let g:airline_powerline_fonts = 1 " Modifica los separadores para que tengan forma de triangulos
let g:airline_theme='tomorrow'

"signify
" Change these if you want
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1


" Jump though hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gJ
nmap <leader>gK 9999<leader>gk

" If you like colors instead
highlight SignifySignAdd                  ctermbg=green                guibg=#00ff00
highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#ff0000
highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00

nnoremap / /a<DEL>

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"vim emmet configuration
let g:user_emmet_leader_key='<C-Z>'

"easymotion
nmap <leader>f <Plug>(easymotion-s2)
let g:EasyMotion_smartcase = 1

"Rust configuration
let g:rustfmt_autosave = 1

"prettier configuration for vim
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

"configuring the highlight devicons
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

"configuring clang
let g:clang_format#auto_format = 1

"indentline
let g:indentLine_char_list = ['│', '┊']

"Modificacion de los ajustes de resaltado de sintaxis de java
highlight link JavaIdentifier NONE
