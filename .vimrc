
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" original repos on github
"
" Plugin 'Shougo/neocomplete.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'fatih/vim-go'
Plugin 'JamshedVesuna/vim-markdown-preview'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'jaxbot/browserlink.vim.git' "does this work?
Plugin 'nathanaelkane/vim-indent-guides' "use ig
" Plugin 'davidhalter/jedi-vim' "replace with youcomplete me if using other languages
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'rust-lang/rust.vim' "rust
Plugin 'racer-rust/vim-racer'
Plugin 'ervandew/supertab' "NOTE would conflict with YCM if you used it. or ultrasnips?
Plugin 'scrooloose/syntastic'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript.git' 
Plugin 'mileszs/ack.vim' "ack something to search
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'tpope/vim-fugitive'
Plugin 'mbbill/undotree'  "gundo improvement
Plugin 'alfredodeza/pytest.vim' "PYtest class, file object..
Plugin 'pearofducks/ansible-vim'
Plugin 'kien/ctrlp.vim' "ctrl v and s open windows in split
Plugin 'jasoncodes/ctrlp-modified.vim'
Plugin 'godlygeek/tabular' "creates a list of modules
Plugin 'plasticboy/vim-markdown' "allows markdown rendering in gvim
Plugin 'gregsexton/gitv'
Plugin 'scrooloose/nerdtree' "relative path and file creation
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tmhedberg/SimpylFold.git'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar' "shows classes
Plugin 'vim-scripts/TaskList.vim' "leader td
" Plugin 'vim-scripts/YankRing.vim'
Plugin 'MarcWeber/vim-addon-mw-utils' "some advanced setup thing im not using
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat' " helps remap period (.) im not using this
Plugin 'mattn/webapi-vim' "needed for gists AWESOME
Plugin 'mattn/gist-vim' " awesome
Plugin 'mattboehm/unstack' "using a txt file with a stack trace in it, combine with output (,e)
Plugin 'tyru/open-browser.vim' "gx for search
Plugin 'bling/vim-airline'
Plugin 'gregsexton/MatchTag' "highlights matching html tag TODO not using because jinja?
" Plugin 'python-rope/ropevim' "rename packages
Plugin 'joonty/vdebug.git' "debugger
Plugin 'Shougo/neocomplete.vim'
Plugin 'kien/rainbow_parentheses.vim'
" Plugin 'airblade/vim-gitgutter'
Plugin 'easymotion/vim-easymotion'


"ruby and rails
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'
Plugin 'elmcast/elm-vim'


" from vim probably check to see if there are google
Plugin 'jcf/vim-latex.git' "TODO

Plugin 'xuhdev/vim-latex-live-preview.git' "good preview
Plugin 'tpope/vim-unimpaired' "Maping tools TODO not using
Plugin 'SirVer/ultisnips' " good
Plugin 'honza/vim-snippets' " I cant remember if i need both this and utsnips
Plugin 'vim-scripts/Auto-Pairs'

"Plugin 'AutoComplPop'

Plugin 'CSApprox' "TODO im i using this? color scheme for vim
Plugin 'L9' "TODO im i using this? for programming in vim

"clojure plugins

Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'vim-scripts/paredit.vim'
Plugin 'snoe/nvim-parinfer.js'

"javascript plugins
Plugin 'mxw/vim-jsx'


call vundle#end()            " required


" call plug#begin('~/.vim/plugged')


" " Make sure you use single quotes
" Plug 'junegunn/seoul256.vim'

" " Add plugins to &runtimepath
" call plug#end()

let mapleader=","             " change the leader to be a comma vs slash


" drew copy to sys clipboard
vmap <leader>0 "*p

set clipboard=unnamed

" arrow keys
noremap <Up> <c-k>
noremap <Down> <c-j>

"drew addition paste easier
set pastetoggle=<F2>

" TODO depreciated for below Execute python file being edited with <Shift> + e:
" map <buffer> <S-e> :w<CR>:!/usr/bin/env python3 %<CR>
"Drew file output -> window above
map <silent> <leader>e :w<CR> :new  output.txt<CR>:res 1<CR>:read !ruby #<CR><CR>
" close window above without saving 
map <silent> <leader>x <C-K>:q!<CR>

"jsx in javascript
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" syntastic to u se eslint see ./eslint
let g:syntastic_javascript_checkers = ['eslint']



" window resize
" http://vim.wikia.com/wiki/Fast_windowizing_with_plus/minus_keys
" Window resizing mappings /*{{{*/
" Maps Alt-[h,j,k,l] to resizing a window split
map <silent> <S-h> <C-w><
map <silent> <S-j> <C-W>-
map <silent> <S-k> <C-W>+
map <silent> <S-l> <C-w>>

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_python_python_exec = '/usr/bin/python3.4'
let g:syntastic_python_checkers=['pylint', 'flake8']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_auto_jump = 0
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

"flake
"wrapes pyflakes and pep8 and ned batchelders mchacbe script (wtf is"that)
" useful for checking jinja seem to lose pylint inspection
" passive vs active controls when things are checked
let g:syntastic_mode_map = { 'mode': 'passive',
                            \ 'active_filetypes': [],
                            \ 'passive_filetypes': ['python', 'ruby', 'cucumber', 'scss', 'haml', 'sass'] }
"
set nocompatible              " Don't be compatible with vi TODO why?


nmap <leader>c :w<CR> :SyntasticCheck<CR>
nmap <leader>ct :SyntasticToggleMode<CR>

" Seriously, guys. It's not like :W is bound to anything anyway.
" TODO what does this do?
command! W :w
fu! SplitScroll()
    :wincmd v
    :wincmd w
    execute "normal! \<C-d>"
    :set scrollbind
    :wincmd w
    :set scrollbind
endfu

nmap <leader>sb :call SplitScroll()<CR>
" sudo write this
cmap W! w !sudo tee % >/dev/null
" Toggle the tasklist
map <leader>td <Plug>TaskList

" run py.test's
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>
"
" Reload Vimrc
map <silent> <leader>R :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
" open/close the quickfix window TODO what are quickfix windows?
" nmap <leader>c :copen<CR>
" nmap <leader>cc :cclose<CR>
" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null

" ctrl-jklm  changes to that split
map <c-m> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" and lets make these all work in insert mode too ( <C-O> makes next cmd
"  happen as if in command mode )
imap <C-W> <C-O><C-W>
" Open NerdTree
map <leader>n :NERDTreeToggle<CR>

" Ack searching
nmap <leader>f <Esc>:Ack!
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
"
nmap <leader>h :UndotreeToggle<CR>
" Jump to the definition of whatever the cursor is on
"Drew Addition
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
filetype plugin on            " TODO is this redudent with above?
set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
"set background=light           " We are using light background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.
set nofoldenable
" used with solarized
syntax enable
let g:solarized_termcolors = 256
set background=dark

if has('gui_running')
  colorscheme solarized
else
  colorscheme solarized
  " something for console Vim
endif



"spellcheck
set spell
set spelllang=en_us
" don't bell or blink
set noerrorbells
" TODO what do these do?
set noeb vb t_vb=
au GUIEnter * set vb t_vb=" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**
set grepprg=ack         " replace the default grep program with ack
" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>
" Disable the colorcolumn when switching modes.  Make sure this is the
" first autocmd for the filetype here
""" Insert completion
" don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
set pumheight=6             " Keep a small completion window
""" Moving Around/Editing
set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set tabstop=2             " <tab> inserts 4 spaces
set shiftwidth=2           " but an indent level is 2 spaces wide.
set softtabstop=2          " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
inoremap # #
" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set nomodeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.
"""" Messages, Info, Status
set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}
" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
"set list
""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

" Paste from clipboard
map <leader>p "+p

" need for yank 
" " copy to register clipboard
" nnoremap <leader>y :%y+<CR>
" hide matches on <leader>space TODO is this doing anytihng?
nnoremap <leader><space> :nohlsearch<cr>
" Remove trailing whitespace
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>
" Select the item in the list with enter TODO what?
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" ==========================================================
" Javascript
" ==========================================================
" TODO what is this doing?
au BufRead *.js set makeprg=jslint\ %
" ===========================================================
" FileType specific changes
au FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au FileType coffee setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
"autocmd FileType jinja,htmldjango,html,xhtml,xml,css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
autocmd FileType feature ts=2 sts=2 sw=2

" 

" ---------------- TODO WHAT is this?
" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif
" Load up virtualenv's vimrc if it exists
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif
set colorcolumn=79
" spaces for html files
set t_Co=256

" fold from https://github.com/tmhedberg/SimpylFold
let g:SimpylFold_docstring_preview = 1

" ----------- latax ------------------
"
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.


" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" On *nix platform TODO whats this?
" let g:Tex_ViewRuleComplete_html = 'MozillaFirebird $*/index.html &'



" octave
augroup filetypedetect
     au! BufRead,BufNewFile *.m setfiletype octave
augroup END

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2

" gist pastebin
let g:gist_clip_command = 'xclip -selection clipboard'

" open-browser
let g:netrw_nogx = 1 " disable netrw's gx mapping. 
nmap gx <Plug>(openbrowser-smart-search) 
vmap gx <Plug>(openbrowser-smart-search) 

"--------------- rope -----------
"
"  let ropevim_local_prefix = "<leader>r"

" avoid the esc key
:imap jk <Esc>


" uuper tab tab and s-tab are the defaults
let g:SuperTabMappingForward = '<tab>'
let g:SuperTabMappingBackward = '<s-tab>'


" ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
" let g:UltiSnipsEditSplit="vertical"

" vdebug
" To debug a script called "myscript.py", run the following: >
"     python -S path/to/pydbgp -d localhost:9000 myscript.py
" % is the current buffer 
" TODO not working make it one line to start!
" nmap <leader>ds :!/usr/bin/env python -S ~/debug/pydbgp -d localhost:9000 %<CR>
" cant get it to work, just use wdb
" let g:vdebug_keymap = {
" \    "run" : "<s-r>",
" \    "run_to_cursor" : "<s-n>",
" \    "step_over" : "<s-o>",
" \    "step_into" : "<s-i>",
" \    "step_out" : "<s-e>",
" \    "close" : "<s-c>",
" \    "detach" : "<s-d>",
" \    "set_breakpoint" : "<s-b>",
" \    "get_context" : "<s-t>",
" \    "eval_under_cursor" : "<s-u>",
" \    "eval_visual" : "<s-v>",
" \}

"unstack default is leader s
" let g:unstack_mapkey=<leader>s
"
" faster save TODO tinker
nmap <s-u> :w<CR>
nmap <s-y> :wq<CR>

" enclose something with )
" :map ) viWS)<CR>
" :map ] viWS]<CR>
" :map } viWS}<CR>

" -------------- neo ----------------
"
" " -------------- ycm ------------
" let g:ycm_use_ultisnips_completer = 1

" let g:ycm_path_to_python_interpreter="/usr/bin/python2.7"

" " ------------ jedi ------------

" let g:jedi#use_splits_not_buffers = "top"
" let g:jedi#show_call_signatures = 1
" let g:jedi#documentation_command = "D"
" let g:jedi#usages_command = "<leader>u"
" let g:jedi#goto_assignments_command = "<leader>a"
" let g:jedi#goto_definitions_command = "<leader>d"
" let g:jedi#rename_command = "<leader>jr"
" let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 1
" let g:jedi#show_call_signatures = 1
" let g:jedi#force_py_version = 3
" let g:jedi#popup_select_first = 0



" rainbow parens
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"color column
let &colorcolumn="80,".join(range(120,999),",")

" quick test
vmap <leader>tt :s/ /_/g<CR><leader><Space>

" ctrlp modifications
"
" TODO i'm i using this?
map <c-p> :CtrlPModified<CR>
map <Leader>M :CtrlPBranch<CR>

" change from c-p because were using modified version (above) which shows
" files not yet in git history

"
let g:ctrlp_prompt_mappings = {
  \ 'PrtBS()':              ['<bs>', '<c-]>'],
  \ 'PrtDelete()':          ['<del>'],
  \ 'PrtDeleteWord()':      ['<c-w>'],
  \ 'PrtClear()':           ['<c-u>'],
  \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
  \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
  \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
  \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
  \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
  \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
  \ 'PrtHistory(-1)':       ['<c-n>'],
  \ 'PrtHistory(1)':        ['<c-p>'],
  \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
  \ 'AcceptSelection("h")': ['<c-i>'],
  \ 'AcceptSelection("t")': ['<c-t>'],
  \ 'AcceptSelection("v")': ['<c-s>', '<RightMouse>'],
  \ 'ToggleFocus()':        ['<s-tab>'],
  \ 'ToggleRegex()':        ['<c-r>'],
  \ 'ToggleByFname()':      ['<c-d>'],
  \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
  \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
  \ 'PrtExpandDir()':       ['<tab>'],
  \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
  \ 'PrtInsert()':          ['<c-\>'],
  \ 'PrtCurStart()':        ['<c-a>'],
  \ 'PrtCurEnd()':          ['<c-e>'],
  \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
  \ 'PrtCurRight()':        ['<c-l>', '<right>'],
  \ 'PrtClearCache()':      ['<F5>'],
  \ 'PrtDeleteEnt()':       ['<F7>'],
  \ 'CreateNewFile()':      ['<c-y>'],
  \ 'MarkToOpen()':         ['<c-z>'],
  \ 'OpenMulti()':          ['<c-o>'],
  \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
  \ }

" rust completion
set hidden
let g:racer_cmd = "/home/drew/.vim/bundle/racer"
let $RUST_SRC_PATH="/usr/local/bin/"

" rspec

map <Leader>rc :call RunCurrentSpecFile()<CR>
map <Leader>rn :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

" no hover?
" set noballooneval

" Disable hover tooltips
" set noballooneval
let g:netrw_nobeval = 1

" Debug ycm

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" " `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" " or
" " `s{char}{char}{label}`
" " Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)
"
" " Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
"
"" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)"
" "

"git  config

" Require tpope/vim-repeat to enable dot repeat support
" " Jump to anywhere with only `s{char}{target}`
" " `s<CR>` repeat last find motion.
nmap s <Plug>(easymotion-s)
" " Bidirectional & within line 't' motion
omap t <Plug>(easymotion-bd-tl)
" " Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
"  " type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
"  " Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1


"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


" ansible
"
let g:ansible_extra_syntaxes = "sh.vim ruby.vim"

