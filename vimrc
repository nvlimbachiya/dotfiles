" ############################################ .vimrc.before ############################################
let mapleader = ","
set dir=$HOME/.vim/swap//



" ############################################ .vimrc ############################################
"
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

Plug 'airblade/vim-gitgutter'           " Git diff in sign column
Plug 'altercation/vim-colors-solarized' " Colorscheme
Plug 'bronson/vim-trailing-whitespace'  " Trailing whitespace notifier
Plug 'ctrlpvim/ctrlp.vim'               " Fuzzy file search
Plug 'dense-analysis/ale'               " Syntax checker
Plug 'janko/vim-test'                   " Run tests
Plug 'mileszs/ack.vim'                  " ACK search
Plug 'pangloss/vim-javascript'          " Javascript bundle for syntax highlighting and improved indentation
Plug 'preservim/nerdtree'               " File explorer Plugin
Plug 'sjl/gundo.vim'                    " Undo Tree visualizer
Plug 'terryma/vim-multiple-cursors'     " Multiple cursors
Plug 'tpope/vim-surround'               " quoting/parenthesizing
Plug 'vim-airline/vim-airline'          " Status/tabline
Plug 'vim-airline/vim-airline-themes'   " Status/tabline Themes
" Plug 'valloric/youcompleteme'         " Code completion

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()



" ############################################ .vimrc.after ############################################

" ********** Tabs **********
set tabstop=4
set softtabstop=4
set expandtab                     " use spaces, not tabs
set shiftwidth=4
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

" ********** Windows **********
set equalalways
set splitbelow splitright

" ********** Colors **********
syntax enable
set background=dark
colorscheme solarized

" ********** Misc **********
set nowrap
set number
set vb t_vb=
set updatetime=100 "Delay time controlled by VIM; default 4000

" ********** Pastemode **********
set pastetoggle=<leader>p

" ********** Key Mapping **********
imap ii <Esc>
map <leader>f :NERDTreeFind<cr>
map <leader>n :NERDTreeToggle<cr>

" ********** Status Line **********
set ruler
set ch=1
set laststatus=2

" ********** Searching **********
set hlsearch   " highlight search
set incsearch  " incremental search, search as you type
set ignorecase " Ignore case when searching
set smartcase  " Ignore case when searching lowercase
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<cr>

" ********** ALE setup **********
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
            \'javascript': ['prettier'],
            \'jsx': ['prettier'],
            \'javascript:jsx': ['prettier'],
            \}

" ********** Javascript bundle setup **********
let g:javascript_plugin_jsdoc = 1

" ********** Test runner **********
nmap <silent> t<C-n> :TestNearest<cr>
nmap <silent> t<C-f> :TestFile<cr>
nmap <silent> t<C-s> :TestSuite<cr>
nmap <silent> t<C-l> :TestLast<cr>
nmap <silent> t<C-g> :TestVisit<cr>

" ********** Trailing whitespace **********
map <leader>w :FixWhitespace<cr>

" ********** List chars **********
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen
" ********** List chars **********
set cursorline
set cursorcolumn
:nnoremap <Leader>c :set cursorline! cursorcolumn!<cr>

" ********** ACK shortcut **********
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" ********** CtrlP **********
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" ********** Gundo **********
nnoremap <F5> :GundoToggle<CR>
