" Author: Hameedullah Khan
" Email: h@hameedullah.com

" Directory path for plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'

" Theme and display plugins
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips', {'on': []} | Plug 'honza/vim-snippets'
" You Complete Me with install
Plug 'Valloric/YouCompleteMe', { 'do': './install.py', 'on':[] }
augroup load_us_ycm
  autocmd!
  autocmd InsertEnter * call plug#load('ultisnips', 'YouCompleteMe')
                     \| call youcompleteme#Enable() | autocmd! load_us_ycm
augroup END

" NERDTree Plugins
Plug 'scrooloose/nerdtree', { 'on':  '<Plug>NERDTreeTabsToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': '<Plug>NERDTreeTabsToggle' }
Plug 'jistr/vim-nerdtree-tabs', { 'on': '<Plug>NERDTreeTabsToggle' }
augroup nerd_loader
  autocmd!
  autocmd VimEnter * silent! autocmd! FileExplorer
  autocmd BufEnter,BufNew *
        \  if isdirectory(expand('<amatch>'))
        \|   call plug#load('nerdtree')
        \|   call plug#load('nerdtree-git-plugin')
        \|   call plug#load('vim-nerdtree-tabs')
        \|   execute 'autocmd! nerd_loader'
        \| endif
augroup END

" Trying FZF as an alternative to CtrlP
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all', 'on': ['FZF', 'Files', 'Buffers', 'History', 'Commits'] }
Plug 'junegunn/fzf.vim', {'on': ['FZF', 'Files', 'Buffers', 'History', 'Commits'] }


" Development
Plug 'tpope/vim-fugitive'
  " Faster git log browse
  Plug 'junegunn/gv.vim'
  " More functionality, cherry-pick, remove branch, etc
  Plug 'gregsexton/gitv', {'on': ['Gitv'] }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'w0rp/ale'
Plug 'rodjek/vim-puppet'

call plug#end()

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" set list chars
set listchars=tab:›\ ,trail:•,extends:#,precedes:<,nbsp:. " Highlight problematic whitespace
set list

" Wirht wrapping enable vim bheaves very slow
set nowrap

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Do auto indenting but do it smartly
set smartindent

" Smart Tab, to work with tabs smartly
set smarttab

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Split defaults
set splitbelow

" Quickly time out on keycodes, but never time out on mappings
"set notimeout ttimeout ttimeoutlen=200
" Don't wait 1s when pressing <esc> taken from:
" http://dominique.pelle.free.fr/.vimrc.html
set timeout timeoutlen=3000 ttimeoutlen=100

    " Show match, briefly jumps to the matching bracket
    set showmatch

" Very useful for me
" Use <F2> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F2>

        " Better command-line completion
        set wildmenu
        set wildmode=list:full

        " Command line completion inteligently
        " Ignore these filenames during enhanced command line completion.
        set wildignore+=*.aux,*.out,*.toc " LaTeX intermediate files
        set wildignore+=*.jpg,*.bmp,*.gif " binary images
        set wildignore+=*.luac " Lua byte code
        set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
        set wildignore+=*.pyc " Python byte code
        set wildignore+=*.spl " compiled spelling word lists
        set wildignore+=*.sw? " Vim swap files


        " Show partial commands in the last line of the screen
        set showcmd

" Display line numbers on the left
set number
set relativenumber

set nofoldenable    " disable folding

        set cursorline  " highlight current line

" Colors and Themes
set background=dark         " Assume a dark background
colorscheme solarized
let g:solarized_termtrans = 1

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'

" Allow to trigger background
function! ToggleBG()
    let s:tbg = &background
    " Inversion
    if s:tbg == "dark"
        set background=light
    else
        set background=dark
    endif
endfunction
noremap <leader>bg :call ToggleBG()<CR>

    " Global Indentation Settings {
        " Indentation settings for using 4 spaces instead of tabs.
        " Do not change 'tabstop' from its default value of 8 with this setup.
        set shiftwidth=4
        set softtabstop=4
        set expandtab

        " When using < and > shift to round
        " it defaults to shifting to multiple of shiftwidth
        set shiftround
    " This mapping allows to stay in visual mode when indenting with < and >
    " Its very annoying that on every indent outdent we lose visual mode
    vnoremap > >gv
    vnoremap < <gv

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null

" UltiSnips triggering
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" leader
let mapleader = ','
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>sv :so $MYVIMRC<cr>


set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:airline_theme='solarized'

" NERD Tree Tabs key
map <Leader>n <Plug>NERDTreeTabsToggle<CR>


"ALE configuration
" Write this in your vimrc file
let g:ale_lint_on_save = 1
"let g:ale_lint_delay = 1000
"let g:ale_lint_on_text_changed = 0


" vim:set ft=vim et sw=2:
