filetype plugin on

set nocompatible        " Use vim, no vi defaults
set number              " Show line numbers
set numberwidth=5       " minimal number of columns for line numbers
set ruler               " Show line and column number
set autoread            " Auto reload file changed outside of vim
set nobackup
set noswapfile
set laststatus=2        " Nice statusbar

set hlsearch            " highlight matches
set incsearch           " incremental searching
set ignorecase          " searches are case insensitive...
set smartcase           " ... unless they contain at least one capital letter
set completeopt=menu,menuone,preview

set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1

set encoding=utf-8      " Set default encoding to UTF-8
set path=$PWD/**
set sh=/bin/zsh         " Set shell for shell commands from within vim
syntax enable           " Turn on syntax highlighting allowing local overrides

let mapleader = ","     " change mapleader

filetype off            " required!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Plugins                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

"===> essential -----------------------------------------------------
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'jlanzarotta/bufexplorer'

"===> autocomplete / snippets  --------------------------------------
Plugin 'valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'

"===> html / css ----------------------------------------------------
Plugin 'kogakure/vim-sparkup'       " zencoding
Plugin 'cakebaker/scss-syntax.vim'  " scss syntax

"===> javascript  ---------------------------------------------------
Plugin 'othree/yajs.vim'            " js syntax
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'mxw/vim-jsx'                " react jsx syntax
" Plugin 'moll/vim-node'

"===> php -----------------------------------------------------------
Plugin 'StanAngeloff/php.vim'       " php syntax
Plugin 'xsbeats/vim-blade'          " laravel php template syntax

"===> misc ----------------------------------------------------------
Plugin 'rking/ag.vim'               " silver searcher (ack replacement)
Plugin 'henrik/vim-indexed-search'  " displays number matches in searches
Plugin 'altercation/vim-colors-solarized'

" vim-scripts repos
Plugin 'ZoomWin'
" Plugin 'vimwiki'

call vundle#end()
filetype plugin indent on     " required!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Plugin Settings                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"===> ctrlp ---------------------------------------------------------
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

"===> nerdtree ------------------------------------------------------
map <leader>n :NERDTreeToggle<CR>       " Default mapping, <leader>n
let NERDTreeShowHidden=1                " show hidden files, too
let NERDTreeQuitOnOpen=1                " Quit on opening files from the tree
let NERDTreeHighlightCursorline=1       " highlight the selected entry in the tree
let NERDTreeMouseMode=3                 " use a single click for everything
let NERDTreeChDirMode=2                 " automatically CWD to root node
let NERDTreeIgnore=[ '^\.git$','^\.svn$','^\.DS_Store$','^\.[\w\.]+\.swp$' ]
let g:NERDTreeDirArrows=0               " don't display fancy arrows

"===> tcomment_vim --------------------------------------------------
vmap # :TComment<CR>

"===> vim-surround --------------------------------------------------
xmap s <Plug>VSurround                  " Fuck tpope (vim-surround)

" Better surround
let g:surround_40 = "(\r)"
let g:surround_91 = "[\r]"
let g:surround_60 = "<\r>"

"===> youcompleteme -------------------------------------------------
" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
let g:ycm_key_list_select_completion   = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

"===> ultisnips -----------------------------------------------------
let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

"===> supertab ------------------------------------------------------
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0

"===> vim-jsx -------------------------------------------------------
let g:jsx_ext_required = 0              " Allow JSX in normal JS files

"===> zoomwin -------------------------------------------------------
map <Leader>zz :ZoomWin<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 File Types                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Additional file type setup
au BufNewFile,BufRead Jakefile set filetype=javascript
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.hogan set filetype=html
au BufNewFile,BufRead *.blade.php set filetype=html.blade
au BufNewFile,BufRead *.css set fdm=marker fmr={,}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Whitespace                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nowrap                        " don't wrap lines
set tabstop=4                     " a tab is two spaces
set shiftwidth=4                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode
" set smartindent
" set autoindent
" filetype indent on              " load indent file for the current filetype

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Wild Settings                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TODO: Investigate the precise meaning of these settings
" set wildmode=list:longest,list:full
set wildmode=longest,list:longest

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Key Mappings                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" convenient esc
map! jj <ESC>

" map search / to 'ö'
map ö /
"
" clear search highlights
noremap <Leader><space> :nohls<CR>

" map capital W to lower case - I ofter accidentally tiggered capital W
command! W :w

" go back to last buffer
map gb <C-^>

" imap <Tab> <C-P>
" add ALT+j / ALT+k to move lines down / up (in visual mode)
" nnoremap <A-j> :m+<CR>==
" nnoremap <A-k> :m-2<CR>==
" inoremap <A-j> <Esc>:m+<CR>==gi
" inoremap <A-k> <Esc>:m-2<CR>==gi
" vnoremap <A-j> :m'>+<CR>gv=gv
" vnoremap <A-k> :m-2<CR>gv=gv

" easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" jump to matching pairs easily, with tab
nnoremap <Tab> %
vnoremap <Tab> %

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" add svn blame shortcut for selected text
vmap gl :<C-U>!svn blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<")


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use Node.js for JavaScript interpretation
let $JS_CMD='node'

" save buffer position when switching
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

" set t_Co=256
colorscheme solarized
set background=dark
