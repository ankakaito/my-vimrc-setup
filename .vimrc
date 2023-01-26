set shell=/bin/bash
set nocompatible
set nowrap
set encoding=utf8
set number
set ruler

" Set Proper Tabs "
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set ts=2 sts=2 sw=2 et ai si
"set rnu
"""" START Vundle Configuration """"

" Disable file type for vundle "
"filetype off                  " required "
filetype plugin indent on

"set the runtime path to include Vundle and initialize "
set rtp+=~/.vim/bundle/Vundle.vim
set path+=**
call vundle#begin()

" let Vundle manage Vundle, required "
Plugin 'gmarik/Vundle.vim'

" Utility "
Plugin 'scrooloose/nerdtree'
Plugin 'alvan/vim-closetag'
Plugin 'sheerun/vim-polyglot'
"Plugin 'neoclide/coc.nvim', {'branch': 'release'}
"Plugin 'jiangmiao/auto-pairs'
Plugin 'godlygeek/tabular'
Plugin 'preservim/vim-markdown'

" Themes "
Plugin 'AnsiEsc.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'sjl/badwolf'
Plugin 'sickill/vim-monokai'
Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'
"Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'junegunn/limelight.vim'
"Plugin 'mkarmona/colorsbox'
Plugin 'romainl/Apprentice'
Plugin 'Lokaltog/vim-distinguished'
"Plugin 'chriskempson/base16-vim'
"Plugin 'w0ng/vim-hybrid'
"Plugin 'AlessandroYorba/Sierra'
"Plugin 'daylerees/colour-schemes'
"Plugin 'effkay/argonaut.vim'
Plugin 'ajh17/Spacegray.vim'
Plugin 'atelierbram/Base2Tone-vim'
"Plugin 'colepeters/spacemacs-theme.vim'
Plugin 'tribela/vim-transparent'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
" Install UltiSnips
Plugin 'SirVer/ultisnips'
" Install Odoo snippet
Plugin 'akretion/vim-odoo-snippets'
Plugin 'honza/vim-snippets'

call vundle#end()            " required "

" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

"    Configuration Section    " 
"""""""""""""""""""""""""""""""

" Always display the status line "
set laststatus=2
" Enable Elite mode, No ARRRROWWS "
let g:elite_mode=1

" Enable highlighting of the current line and Poping Code"
set cursorline
" Theme and Styling "
set t_Co=256

set number
set guifont=MesloLGL\ Nerd\ Font:14
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
endif
autocmd StdinReadPre * let s:std_in=1

if (has("termguicolors"))
  set termguicolors
endif

let g:WebDevIconsOS = 'Darwin'

let base16colorspace=256  " Access colors present in 256 colorspace "
colorscheme spacegray
"colorscheme monokai
"colorscheme molokai
"colorscheme gruvbox
let g:spacegray_underline_search = 1
let g:spacegray_italicize_comments = 1

" Vim-Airline Configuration "
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 
let g:airline_theme='hybrid'
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 

""""""""""""""""""""""""""""""""""""""
"    Vim KeyBinding Customization    "
""""""""""""""""""""""""""""""""""""""
map <C-right> <C-w>w
map <C-left> <C-w>p
map <C-top> <C-w><Up>
map <C-down> <C-w><Down>

nnoremap K :m .-2<CR>==
nnoremap J :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

""""""""""""""""""""""""""""""""""""""
"  Mappings NerdTree configurationn  "
""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
map <C-b> :NERDTreeFocus<CR>
map <C-m> :TagbarOpen j<CR>
let NERDTreeMapActivateNode='<space>'

"t = Open the selected file in a new tab "
"i = Open the selected file in a horizontal split window "
"s = Open the selected file in a vertical split window "
"I = Toggle hidden files "
"m = Show the NERD Tree menu "
"R = Refresh the tree, useful if files change outside of Vim "

""""""""""""""""""""""""""""""""""""""
"       Markdown runtime Files       "
""""""""""""""""""""""""""""""""""""""
let g:markdown_syntax_conceal = 0
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:markdown_minlines = 100

""""""""""""""""""""""""""""""""""""""
"     Fuzzy finder Configuration     "
""""""""""""""""""""""""""""""""""""""
map <C-p> :Files<Cr>
map <C-j> :bprevious<Cr>
map <C-l> :bnext<Cr>

nnoremap <C-f> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-v': 'vsplit' }

"  Mappings CloseTag configurationn  "
""""""""""""""""""""""""""""""""""""""
" filenames like *.xml, *.html, *.xhtml, ... "
" These are the file extensions where this plugin is enabled. "
let g:closetag_filenames = '*.xml,*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ... "
" This will make the list of non-closing tags self-closing in the specified files. "
let g:closetag_xhtml_filenames = '*.xml,*.html,*.xhtml,*.phtml'

" filetypes like xml, html, xhtml, ..."
" These are the file types where this plugin is enabled. "
let g:closetag_filetypes = 'xml,html,xhtml,phtml'

" filetypes like xml, xhtml, ... "
" This will make the list of non-closing tags self-closing in the specified files. "
let g:closetag_xhtml_filetypes = 'xml,html,xhtml,phtml' 	

" integer value [0|1] "
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.) "
let g:closetag_emptyTags_caseSensitive = 1

" dict "
" Disables auto-close if not in a "valid" region (based on filetype) "
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>' "
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is '' "
let g:closetag_close_shortcut = '<leader>>'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

syntax on
