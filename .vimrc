" Author: Hameedullah Khan
" Email: h@hameedullah.com

" Directory path for plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

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

" You Complete Me with install
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

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

" Colors and Themes
set background=dark         " Assume a dark background

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


" vim:set ft=vim et sw=2:
