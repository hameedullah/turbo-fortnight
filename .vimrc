" Author: Hameedullah Khan
" Email: h@hameedullah.com

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Directory path for plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'

" Theme and display plugins
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Indent guides
Plug 'nathanaelkane/vim-indent-guides'

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
Plug 'rhysd/conflict-marker.vim'
Plug 'idanarye/vim-merginal'
Plug 'w0rp/ale', {'for': ['vim','python','php','puppet','yaml','js','css','html','json']}
Plug 'rodjek/vim-puppet', {'for': 'puppet'}

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

"let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])


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




" NERD Tree Tabs key
map <Leader>n <Plug>NERDTreeTabsToggle<CR>
        " Other NERD Tree configurations
        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        "let NERDTreeDirArrowExpandable = '+'
        "let NERDTreeDirArrowCollapsible = '-'
        let NERDTreeMinimalUI = 1
        let NERDTreeDirArrows=1

        "Open NERDTree on console vim startup. (When set to 2, open only if directory was given as startup argument).
        let g:nerdtree_tabs_open_on_console_startup = 2 "(default: 0)
        let g:nerdtree_tabs_open_on_new_tab = 0 "(default: 1)

        " NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('sh*', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('sh', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('pp', 'Magenta', 'none', '#ff00ff', '#151515')
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"

"ALE configuration
" Write this in your vimrc file
let g:ale_lint_on_save = 1
"let g:ale_lint_delay = 1000
"let g:ale_lint_on_text_changed = 0

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=green   ctermbg=23
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=10

" custom mapping for conflict marker
let g:conflict_marker_enable_mappings = 0
nmap <buffer>crt <Plug>(conflict-marker-themselves)
nmap <buffer>cro <Plug>(conflict-marker-ourselves)
nmap <buffer>crn <Plug>(conflict-marker-none)
nmap <buffer>crb <Plug>(conflict-marker-both)

" vim:set ft=vim et sw=2:
