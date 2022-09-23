" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|


let g:python3_host_prog = '/usr/bin/python3'


" ====================
" === Editor Setup ===
" ====================
" ===
" === System
" ===
"set clipboard=unnamedplus

let &t_ut=''
set autochdir

" set path+=~/sw040/1700-generated-config/**7
" set path+=~/sw040/1710-handwritten-config/**7
" Basic setting {{{ === Editor behavior
" ===
" ===
set exrc
set secure
set number
set relativenumber
set cursorline
set hidden
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set nolist
" set list
" set listchars=tab:\|\ ,trail:▫
"禁止产生临时文件
"sdad
set noundofile
set nobackup
set noswapfile

set scrolloff=4
set timeoutlen=500
set viewoptions=cursor,folds,slash,unix
set nowrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
"silent !mkdir -p $HOME/.config/nvim/tmp/sessions
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif
set colorcolumn=100
hi ColorColumn ctermbg=blue
set updatetime=100
set virtualedit=block
set autoread
set autowriteall
set mouse=a
" set termguicolors

" endif
set background=dark
" true color enable
if has("termguicolors")
    " enable true color
    set termguicolors
endif
if &term =~# '^screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

set foldenable
set foldmethod=marker

filetype plugin on"}}}

" Restore the last quit position when open file.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 设置跳出自动补全的括号 {{{
func SkipPair()
	if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == '>' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getli
		return "\<ESC>la"
	else
		return "\t"
	endif
endfunc

inoremap jj <c-r>=SkipPair()<CR>
"}}}
" 常规模式下输入清除行尾 ^M 符号{{{
nmap <space>dM :%s/\r$//g<CR>:noh<CR>
"}}}
" 删除行尾空格 和 Tab{{{
nmap <space>ds :%s/\s\+$//g<CR>:noh<CR>
"}}}
" 删除空行{{{
nmap <space>dl :g/^s*$/d<CR>
"}}}

" ===
" === Terminal Behaviors
" ===
let g:neoterm_autoscroll = 1

autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>

nn <ESC><ESC> :cclose<CR>
"{{{ === Basic Mappings
" ===
" ===
" Set <LEADER>
let mapleader=","

" Save & quit
noremap Q :q<CR>
" noremap <C-q> :qa<CR>
noremap S :w<CR>


" Open the vimrc file anytime
noremap <space>rc :e $HOME/.config/nvim/init.vim<CR>

" Open README.md
noremap <leader>he :vs $HOME/.config/nvim/README.md<CR>
noremap <leader>hd :vs $HOME/.config/nvim/Man<CR>

" Adjacent duplicate words
" noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
" nnoremap <LEADER>tt :%s/    /\t/g
" vnoremap <LEADER>tt :s/    /\t/g

" Folding
" noremap <silent> <LEADER>o za

" nnoremap <c-n> :tabe<CR>:-tabmove<CR>:term lazynpm<CR>


" H key: go to the start of the line
noremap <silent> H 0
" L key: go to the end of the line
noremap <silent> L $

" ===
" === copy/paset between vim and system clipboard
" ===
map <SPACE>pp "+p
map <SPACE>yy "+y

" switch mouse state
noremap <space>ma :set mouse=a<CR>
noremap <space>mv :set mouse=v<CR>

" ===
" === Insert Mode Cursor Movement
" ===
inoremap <C-a> <ESC>A


" ===
" === Command Mode Cursor Movement
" ===
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-n> <Left>
cnoremap <C-l> <Right>
cnoremap <C-j> <C-n>
cnoremap <C-k> <C-p>

" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
" noremap <LEADER>wj <C-w>j
" noremap <LEADER>wh <C-w>h
" noremap <LEADER>wl <C-w>l
nmap <space>wh :vertical res +30<CR>
nmap <space>wl :vertical res -30<CR>
nmap <space>wj :res +15<CR>
nmap <space>wk :res -15<CR>


" Disable the default s key
noremap s <nop>
" Disable the default q key
noremap q <nop>
" start/stop reocrd macro
noremap sq q

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap se :set splitbelow<CR>:split<CR>
noremap sn :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap si :set splitright<CR>:vsplit<CR>



" ===
" === Tab management
" ===
" Create a new tab with tu
noremap tu :tab split<CR>
noremap tU :tabe<CR>
" Motion around tabs
noremap <A-,> :-tabnext<CR>
noremap <A-.> :+tabnext<CR>
" Motion the tabs with tmn and tmi
noremap <A-j> :-tabmove<CR>
noremap <A-k> :+tabmove<CR>

" Close the tab
noremap tc :tabclose<CR>

"motion between buffers
nn <C-l> :bn<CR>
nn <C-h> :bp<CR>
nn <C-d> :bd<CR>

" Press space twice to jump to the next '' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>

" Press ` to change case (instead of ~)
noremap ` ~

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h


" find and replace
noremap \s :%s//g<left><left>

" format python
map <F4> :%!python -m json.tool<CR>


nmap <F10> ggVG=

nmap <F12> :call lsp#disable()<CR>
nmap <SPACE><F12> :call lsp#enable()<CR>


"}}}

" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('$HOME/.config/nvim/plugged')
" Welcome page change
Plug 'mhinz/vim-startify'

" themes and appearance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'AlessandroYorba/Alduin'
" Plug rakr/vim-two-firewatch
" Plug Badacadabra/vim-archery

" An eye catching plugin that fades your inactive buffers and preserves syntax highlighting!!!!
" Plug 'TaDaa/vimade'

" This is a plugin for Vim to dim inactive windows
Plug 'blueyed/vim-diminactive'

" Vim Applications
Plug 'itchyny/calendar.vim'

" the silver serach support
Plug 'vim-scripts/ag.vim'

" Git relative
Plug 'airblade/vim-gitgutter'
Plug 'shjinyuan/vim-fugitive'

" vim-lsp with ccls
Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'  "not used and not setting
" Plug 'neovim/nvim-lspconfig'		" need to config further to check affect

"async complete
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Plug 'jsfaint/gen_tags.vim'

" snippets
Plug 'maralla/completor.vim' "prompt snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" powerful commenter
Plug 'preservim/nerdcommenter'

" system navigation
Plug 'preservim/nerdtree'
Plug 'yegappan/mru'
Plug 'junegunn/fzf'

" parentheses and brackets
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

" Translator
Plug 'voldikss/vim-translator'

" Tips for key's map
Plug 'liuchengxu/vim-which-key'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" support math latex
" Plug 'iamcco/mathjax-support-for-mkdp'

" Auto save
Plug '907th/vim-auto-save'

" multi cursor support
Plug 'terryma/vim-multiple-cursors'

"  buffer managerment
Plug 'bsdelf/bufferhint'

" tagbar which repleace taglist
Plug 'preservim/tagbar'


call plug#end()


"================================================================================
" Plugin setting START
"================================================================================
"
"
"
" ========= airline setting
let g:airline_theme = 'dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#hunks#enabled = 1

" colorscheme blue
" colorscheme darkblue
" colorscheme delek
colorscheme desert
" colorscheme elflord
" colorscheme evening
" colorscheme habamax
" colorscheme industry
" colorscheme koehler
" colorscheme morning
" colorscheme murphy
" colorscheme pablo
" colorscheme peachpuff
" colorscheme quiet
" colorscheme ron
" colorscheme shine
" colorscheme slate
" colorscheme torte
" colorscheme zellner



"
" === vim-lsp with ccls setting
"
if executable('ccls')
	au User lsp_setup call lsp#register_server({
				\ 'name': 'ccls',
				\ 'cmd': {server_info->['ccls']},
				\ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
				\ 'initialization_options': {'cache': {'directory': expand('~/.cache/ccls') }},
				\ 'allowlist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
				\ })
endif
	let g:lsp_preview_keep_focus = 0
	let g:lsp_preview_float = 0
	let g:lsp_preview_autoclose = 0
" Key bindings for vim-lsp.
nn <silent> <M-d> :vs +LspDefinition<cr>
nn <silent> <M-r> :vs +LspReferences<cr>
nn <f2> :LspRename<cr>
nn <silent> <M-a> :vs +LspWorkspaceSymbol<cr>
nn <silent> <M-s> :vs +LspDocumentSymbol<cr>

function! s:on_lsp_buffer_enabled() abort
	setlocal omnifunc=lsp#complete
	setlocal signcolumn=yes
	if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
	nmap <buffer> gd <plug>(lsp-definition)
	nmap <buffer> gs <plug>(lsp-document-symbol-search)
	nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
	nmap <buffer> gr <plug>(lsp-references)
	nmap <buffer> gi <plug>(lsp-implementation)
	nmap <buffer> gt <plug>(lsp-type-definition)
	nmap <buffer> <leader>rn <plug>(lsp-rename)
	nmap <buffer> [g <plug>(lsp-previous-diagnostic)
	nmap <buffer> ]g <plug>(lsp-next-diagnostic)
	nmap <buffer> K <plug>(lsp-hover)
	nnoremap <buffer> <expr><c-j> lsp#scroll(+4)
	nnoremap <buffer> <expr><c-k> lsp#scroll(-4)

	let g:lsp_format_sync_timeout = 1000
	autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

	" refer to doc to add more commands
endfunction

augroup lsp_install
	au!
	" call s:on_lsp_buffer_enabled only for languages that has the server registered.
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


"
" === gen_tags.vim setting
"
" let g:gen_tags#gtags_default_map = 1
" let g:gen_tags#root_marker = ".git"
" let $GTAGSCONF = '/home/wsk/bin/gtags/data/gtags/gtags.conf'
" let $GTAGSLABEL = 'pygments'
"
"
" NERDTREE setting
nmap _ :NERDTreeToggle<CR>

"
" === nerdcommenter setting
"
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1


"
" ===asyncomplete setting
"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"


"
" === translater setting
"
" let g:translator_target_lang = 'zh'
let g:translator_default_engines = ['bing']
" Create default mappings
" Echo translation in the cmdline
nmap <silent> <Leader>te <Plug>Translate<CR>
vmap <silent> <Leader>te <Plug>TranslateV<CR>
" Display translation in a window
" nmap <silent> <Leader>te <Plug>TranslateW<CR>
" vmap <silent> <Leader>te <Plug>TranslateWV<CR>
" Replace the text with translation
" nmap <silent> <Leader>r <Plug>TranslateR<CR>
" vmap <silent> <Leader>r <Plug>TranslateRV<CR>
" Translate the text in clipboard
" nmap <silent> <Leader>x <Plug>TranslateX<CR>


"
" === rainbow_parentheses.vim setting
"
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

"
" === gitgutter setting
"
let g:gitgutter_max_signs = -1
function! GitStatus()
	let [a,m,r] = GitGutterGetHunkSummary()
	return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}
function! NextHunkAllBuffers()
	let line = line('.')
	GitGutterNextHunk
	if line('.') != line
		return
	endif

	let bufnr = bufnr('')
	while 1
		bnext
		if bufnr('') == bufnr
			return
		endif
		if !empty(GitGutterGetHunks())
			1
			GitGutterNextHunk
			return
		endif
	endwhile
endfunction

function! PrevHunkAllBuffers()
	let line = line('.')
	GitGutterPrevHunk
	if line('.') != line
		return
	endif

	let bufnr = bufnr('')
	while 1
		bprevious
		if bufnr('') == bufnr
			return
		endif
		if !empty(GitGutterGetHunks())
			normal! G
			GitGutterPrevHunk
			return
		endif
	endwhile
endfunction

nmap <silent> ]c :call NextHunkAllBuffers()<CR>
nmap <silent> [c :call PrevHunkAllBuffers()<CR>

"
" === vim-which-key setting
"
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>


"
"==== completor setting
"
let g:completor_clang_binary = '/usr/bin/clang'

"
"==== UltriSnips setting
"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" ActivateAddons vim-snippets snipmate

let g:completor_clang_binary = '/usr/bin/clang'

"
"==== auto save plugin_setting
"
let g:auto_save = 1
let g:auto_save_events = ["InsertLeave", "CompleteDone"]

"
"==== bufferhint setting
"
nnoremap - :call bufferhint#Popup()<CR>

"
"==== MRU setting
"
let MRU_Window_Height = 35
nnoremap \ :vertical botright MRUToggle<CR>

"
"==== tagbar setting
"
let g:tagbar_position = 'leftabove vertical'
nnoremap <silent> <F8> :TagbarToggle<CR>

"================================================================================
" Plugin setting END
"================================================================================
"{{{ TODO check the autocmd meaning here
autocmd! bufwritepost $HOME/.config/nvim/init.vim  so <afile>
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

"}}}
"====================================
"			code assist
"====================================
execute 'source ~/.config/nvim/utility/setTitle.vim'
" change cursor mode ,not work in nvim
" - entered insert mode
" let &t_SI = "^[[5 q^[]12;Magenta\007" " blinking bar (Ss) in magenta (Cs)
" - entered replace mode
" let &t_SR = "^[[0 q^[]12;Red\007" " blinking block (Ss) in red (Cs)
" - leaving insert/replace mode
" let &t_EI = "^[[2 q^[]112\007" " terminal power-on style (Se) and colour (Cr)
autocmd InsertEnter,InsertLeave * set cul!
" set guicursor+=n-v-c:blinkon0
" set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
" \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
" \,sm:block-blinkwait175-blinkoff150-blinkon175

" autocmd InsertEnter * set cul
" autocmd InsertLeave * set nocul
"
"===================================
" Cool tricks
"===================================
" insert time
ab xtime <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>



let g:ascii = [
			\ '        __',
			\ '.--.--.|__|.--------.',
			\ '|  |  ||  ||        |',
			\ ' \___/ |__||__|__|__|',
			\ ''
			\]
" let g:startify_custom_header =
			" \ startify#pad(g:ascii + startify#fortune#boxed())
let g:startify_custom_header =
			\ 'startify#pad(g:ascii)'



"{{{
" custom highlight setting
"
"
" ======== Gitgutter sign
" highlight GitGutterChangeInvisible guifg=Red
" highlight GitGutterDeleteInvisible guifg=Red
highlight GitGutterAdd		guifg=Green
highlight GitGutterDelete guifg=Gray
highlight GitGutterChange guifg=Blue
"
"
"========== Diff Mode
" hi DiffAdded cterm=bold ctermfg=6 ctermbg=0  gui=none guifg=0 guibg=white
" hi DiffRemoved cterm=bold ctermfg=6 ctermbg=0  gui=none guifg=0 guibg=white
highlight DiffAdd    cterm=bold ctermfg=11 ctermbg=17 guifg=Black guibg=Green  gui=bold
highlight DiffDelete cterm=bold ctermfg=12 ctermbg=37 guifg=Gray  guibg=Red
highlight DiffChange cterm=bold ctermfg=13 ctermbg=27 guifg=black guibg=Blue
highlight DiffText   cterm=bold ctermfg=14 ctermbg=88 guifg=black guibg=Yellow gui=italic
"
"
"========== Menu for selection
hi Pmenu ctermfg=10 ctermbg=17 guibg=Black guifg=Green
hi PmenuSel ctermfg=10 ctermbg=17 guibg=Gray guifg=White
"}}}

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
	\ 'bg':      ['bg', 'Normal'],
	\ 'hl':      ['fg', 'Comment'],
	\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
	\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
	\ 'hl+':     ['fg', 'Statement'],
	\ 'info':    ['fg', 'PreProc'],
	\ 'border':  ['fg', 'Ignore'],
	\ 'prompt':  ['fg', 'Conditional'],
	\ 'pointer': ['fg', 'Exception'],
	\ 'marker':  ['fg', 'Keyword'],
	\ 'spinner': ['fg', 'Label'],
	\ 'header':  ['fg', 'Comment'] }



" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
	call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
	copen
	cc
endfunction

let g:fzf_action = {
	\ 'ctrl-q': function('s:build_quickfix_list'),
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-x': 'split',
	\ 'ctrl-v': 'vsplit' }


" ActiveWindow: set focus window {{{1
"colorcolumn {{{2
let g:AutoResizeFocusWindow=1
function s:Set_focus_window()
	"after entering another window, set cc=80
	set cc=80
	"hi CursorLineNr term=bold ctermfg=Yellow
	if g:AutoResizeFocusWindow == 1
		if bufname("%") == "__Tagbar__.1"
		elseif bufname("%") == "NERD_tree_1"
		else
			"resize the focus window when the window size < 86
			if winwidth(0) <= 86
				vertical res 99
				"echo "The current window has " . winwidth(0) . " columns."
			endif
		endif
		" display current window's bufname, FIXME: ,f1
		"echo bufname("%")
	endif

	augroup BgHighlight_focus
		" Highlight the text line of the cursor with CursorLine 'hl-CursorLine'.
		set cul
		set relativenumber
		set number
		" syntax on
	augroup END
	checktime
endfunction

" define a shortcut key for enabling/disabling auto resize focus window:
nnoremap  <leader>fx :exe "let g:AutoResizeFocusWindow=exists(\"g:AutoResizeFocusWindow\")?g:AutoResizeFocusWindow*-1+1:1"<CR>

" NonActiveWindow
function s:Set_lose_focus_window()
	"before leaving a window, set cc=""
	set cc=""

	" ActiveWindow
	augroup BgHighlight_loss_fucos
		set nocul
		set norelativenumber
		set nonumber
		" syntax clear
	augroup END
	checktime
endfunction

" 不是 vimdiff 时，自动改变窗口大小; vimdiff 窗口不自动改变大小
if &diff == 0
	autocmd WinEnter,BufEnter * call s:Set_focus_window()
	autocmd WinLeave,BufLeave * call s:Set_lose_focus_window()
endif

" set statusline color {{{2
" default the statusline to White (black character) when entering Vim
hi StatusLine term=reverse ctermfg=White ctermbg=Black gui=bold,reverse

" Insert Mode
function s:Set_InsertEnter_Window()
	hi StatusLine term=reverse ctermfg=DarkMagenta ctermbg=Black gui=undercurl guisp=Magenta

	" Insert mode: CursorLineNr is Cyan
	hi CursorLineNr term=bold ctermfg=Cyan guifg=Blue

	hi Cursor term=bold ctermbg=Cyan guibg=Cyan

	set nornu
	checktime

	" Window resizing
	"vertical res 99
endfunction

" Normal mode
function s:Set_InsertLeave_Window()
	hi StatusLine term=reverse cterMFG=White ctermbg=Black gui=bold,reverse

	" Normal mode: CursorLineNr is Yellow
	hi CursorLineNr term=bold ctermfg=Yellow guifg=Yellow

	set rnu
endfunction

" if version >= 700
	au InsertEnter * call s:Set_InsertEnter_Window()
	au InsertLeave * call s:Set_InsertLeave_Window()
	au BufWinEnter * call s:Set_InsertEnter_Window()
	au BufWinLeave * call s:Set_InsertLeave_Window()
" endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
"It will open a vimdiff-like window with the current buffer and the underlying file highlighting all of the changes between the two.
" :h vimrc_example
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
			\ | wincmd p | diffthis

" :map messages output to ~/.vim/map.txt
command -nargs=? Rmap redir! > ~/.vim/my_help/key_map.txt | silent map | redir END

