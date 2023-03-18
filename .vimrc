set number
set nocompatible
set nowrap
set wildmenu
set showmatch
set incsearch           " Enable incremental search
set hlsearch            " Enable highlight search
set bs=indent,eol,start

set autoindent
set smartindent
set ts=4                " How many columns of whitespace a \t is worth   
set sts=4
set shiftwidth=4        " How many columns of whitespace a "level of indentation" is worth
set expandtab           " Use space when tabbing

set termwinsize=12x0    " Set terminal size
set splitbelow          " Always split below
set mouse=a             " Enable mouse drag onwindow splits

set signcolumn=yes      " Make Vim always render the sign column (for ycm)

filetype plugin indent on 


" vim-Plug Plugin List
call plug#begin('~/.vim/plugged')

" 언어팩 모음 
Plug 'sheerun/vim-polyglot'

" 자동 짝맞추기  
Plug 'jiangmiao/auto-pairs'

" 파일 탐색
Plug 'preservim/nerdtree'

" 파일 구조
Plug 'preservim/tagbar'

" 파일 검색 (파일에 포함된 문자열)  
Plug 'dyng/ctrlsf.vim'

" Switching between .h and .cpp files
Plug 'derekwyatt/vim-fswitch'

" Pulling prototypes into implementation files
Plug 'derekwyatt/vim-protodef'

" YCM, 자동완성 플러그인
Plug 'valloric/youcompleteme', {'do': 'python3 ./install.py --clang-completer --go-completer'}

" 비동기 외부 명령 실행 플러그인  
Plug 'tpope/vim-dispatch'

" 유명한 플러그인들
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'

" Vim-go를 사용하기 위한 Plugin
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" 편의
"Plug 'milkypostman/vim-togglelist'
"Plug 'AndrewRadev/splitjoin.vim'
"Plug 'mhinz/vim-startify'

" preview를 해주는 유용한 plugin
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fzf 사용시 꼭 설치하고 ~/.fzf 에 들어가서 ./install --all 하자
Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()

" auto-pair settings 
let g:AutoPairsShortcutToggle = '<C-P>'

" NERDTree settings
nmap <F2> :NERDTreeToggle<CR>

" tagbar settings
let g:tagbar_autofocus = 1					" Focus the panel when opening it
let g:tagbar_autoshowtag = 1				" Highlight the active tag
let g:tagbar_position = 'botright vertical' " Make panel vertical and place on the right
" Mapping to open and close the panel
nmap <F8> :TagbarToggle<CR>					

" ctrlsf settings
let g:ctrlsf_backend = 'rg'						" Use the ack tool as the backend
let g:ctrlsf_auto_close = { "normal":0, "compact":0 }	" Auto close the results panel when opening a file
let g:ctrlsf_auto_focus = { "at":"start" }			" Immediately switch focus the the search window
let g:ctrlsf_auto_preview = 0						" Don't open the preview window automatically
let g:ctrlsf_case_sensitive = 'smart'				" Use the smart case sensitivity search scheme
let g:ctrlsf_default_view = 'normal'				" Normal mode, not compact mode
let g:ctrlsf_regex_pattern = 0						" Use absolute search by default
let g:ctrlsf_position = 'right'						" Position of the search window
let g:ctrlsf_winsize = '46'							" Width or height of search window
let g:ctrlsf_default_root = 'cwd'					" Search from the current working directory
" (Ctrl-F) Open search prompt (Normal Mode)
nmap <C-F>f <Plug>CtrlSFPrompt
" (Ctrl-F + f) Open search prompt with selection (Visual Mode)
xmap <C-F>f <Plug>CtrlSFVwordPath
" (Ctrl-F + F) Perform search with selection (Visual Mode)
xmap <C-F>F <Plug>CtrlSFVwordExec
" (Ctrl-F + n) Open search prompt with current word (Normal Mode)
nmap <C-F>n <Plug>CtrlSFCwordPath
" (Ctrl-F + o) Open CtrlSF window (Normal Mode)
nmap <C-F>o :CtrlSFOpen<CR>
" (Ctrl-F + t) Toggle CtrlSF window (Normal Mode)
nnoremap <C-F>t :CtrlSFToggle<CR>
" (Ctrl-F + t) Toggle CtrlSF window (Insert Mode)
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" FSwitch setting
au! BufEnter *.cpp let b:fswitchdst = 'hpp,h'
au! BufEnter *.h let b:fswitchdst = 'cpp,c'
nmap <C-Z> :vsplit <bar> :wincmd l <bar> :FSRight<CR>

" YCM setting
"let g:ycm_key_list_select_completion = ['<C-n>']
"let g:ycm_key_list_previous_completion=['<C-p>']
"let g:ycm_key_list_stop_completion = ['<C-x>']

let g:ycm_autoclose_preview_window_after_insertion = 1		" Close prevew window after completing the insertion
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_server_python_interpreter = 'C:\Users\heoja\AppData\Local\Programs\Python\Python311\python.exe'
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings = 1
let g:ycm_complete_in_comments = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_filetype_blacklist = {}
let g:ycm_confirm_extra_conf = 0				" Don't confirm python conf
let g:ycm_always_populate_location_list = 1		" Always populate diagnostics list
let g:ycm_auto_trigger = 1						" Enable completion menu
let g:ycm_show_diagnostic_ui = 1				" Show diagnostic display features
let g:ycm_enable_diagnostic_signs = 1			" Display icons in Vim's gutter, error, warnings
let g:ycm_enable_diagnostic_highlighting = 1	" Highlight regions of diagnostic text
let g:ycm_echo_current_diagnostic = 1			" Echo line's diagnostic that cursor is on

" vim-dispatch settings
" Open vim-dispatch window and scroll to bottom
nnoremap	 <C-m>m		:Copen<CR> <bar> G

" Build debug and release targets
nnoremap	<C-m>bd		:Dispatch! make -C build/Debug<CR>
nnoremap	<C-m>br		:Dispatch! make -C build/Release<CR>

" Map <F6> to the Debug executable with passed filename
function SetBinaryDebug(filename)
	let bpath = getcwd() . "/bin/Debug/" . a:filename
	execute "nnoremap <F6> :Dispatch "
				\ bpath
				\ . " <CR> <bar> :Copen<CR>"
	echo "<F6> will run: " . bpath
endfunction

" Map <F7> to the Release executable with passed filename
function SetBinaryRelease(filename)
	let bpath = getcwd() . "/bin/Release/" . a:filename
	execute "nnoremap <F7> :Dispatch "
				\ bpath
				\ . " <CR> <bar> :Copen<CR>"
	echo "<F7> will run: " . bpath
endfunction


" For Go lang
	" 저장할 때 자동으로 formatting 및 import from https://johngrib.github.io/
	let g:go_fmt_command = "goimports"
	let g:go_list_type = "quickfix"
	let g:go_addtags_transform = "camelcase"
	
	let g:go_autodetect_gopath = 1
	let g:go_highlight_types = 1
	let g:go_highlight_fields = 1
	let g:go_highlight_functions = 1
	let g:go_highlight_function_calls = 1
	let g:go_highlight_extra_types = 1
	let g:go_highlight_generate_tags = 1
	let g:go_highlight_operators = 1
	let g:go_auto_type_info = 1
	let g:go_auto_sameids = 1
	
	" quickfix 이동 및 open/close from https://johngrib.github.io/
	nnoremap <C-n> :cnext<CR>
	nnoremap <C-p> :cprevious<CR>
	nnoremap <LocalLeader>q :call ToggleQuickfixList()<CR>
	
	" 테스트 커버리지 검사 및 색깔 표시 토글 from https://johngrib.github.io/
	nnoremap <LocalLeader>c :GoCoverageToggle<CR>
	
	" 자주 쓰는 기능들 from https://johngrib.github.io/
	autocmd FileType go nnoremap <Tab>b :GoBuild<CR>
	autocmd FileType go nnoremap <Tab>r :GoRun<CR>
	autocmd FileType go nnoremap <Tab><Tab>r :GoRun %<CR>
	 
	autocmd FileType go nnoremap <Tab>t :GoTest<CR>
	autocmd FileType go nnoremap <Tab><Tab>t :GoTestFunc<CR>
	autocmd FileType go nnoremap <Tab>c :GoCoverageToggle<CR>

" gvim font setting
if has("gui_running")
  set encoding=utf-8  

  source $VIMRUNTIME/mswin.vim
  behave mswin
  
  if has('win32')
      set keymodel=startsel
       
      " set guifont=Source\ Code\ Pro:h16:cANSI:qDEFAULT
      " set guifont=JetBrains\ Mono\ Regular:h18:cANSI:qDEFAULT
      set guifont=D2Coding\ ligature:h12:cHANGEUL:qDEFAULT     
	  set renderoptions=type:directx,
                        \gamma:1.0,
                        \contrast:0.5,
                        \level:1,
                        \geom:1,
                        \renmode:5,
                        \taamode:1

      " restore Ctrl-F to Page down
      unmap <C-F>
  elseif has('gui_macvim')  
      set guifont=D2Coding 16
      set antialias
  else
      set guifont=D2Codeing 16
  endif
  " Turn off toolbar
  set guioptions-=T
  " Turn on menu
  set guioptions+=m
end
