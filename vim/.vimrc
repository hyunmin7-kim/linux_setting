" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
"set hidden         " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes) in terminals

" Source a global configuration file if available
" XXX Deprecated, please move your changes here in /etc/vim/vimrc
set nocompatible    " 오리지날 VI와 호환하지 않음
set autoindent      " 자동 들여쓰기
set cindent         " C 프로그래밍용 자동 들여쓰기
set smartindent     " 스마트한 들여쓰기
set visualbell      " 키를 잘못눌렀을 때 화면 프레시
set ruler           " 화면 우측 하단에 현재 커서의 위치(줄,칸) 표시
set shiftwidth=4    " 자동 들여쓰기 4칸
set number          " 행번호 표시, set nu 도 가능
"set fencs=ucs-bom,utf-8,euc-kr.latin1 " 한글 파일은 euc-kr로, 유니코드는 유니코드로
"set fileencoding=utf-8 " 파일저장인코딩 
set tenc=utf-8      " 터미널 인코딩
"set expandtab       " 탭대신 스페이스
set hlsearch        " 검색어 강조, set hls 도 가능
"set nowrapscan      " 검색할 때 문서의 끝에서 처음으로 안돌아감
set nobackup        " 백업 파일을 안만듬
set lbr
"set foldmethod=marker "소스 폴딩
syntax on           " 구문강조 사용
filetype indent on  " 파일 종류에 따른 구문강조
set backspace=eol,start,indent " 줄의 끝, 시작, 들여쓰기에서 백스페이스시 이전줄로
set history=1000    " vi 편집기록 기억갯수 .viminfo에 기록

set backspace=2
set tabstop=8
"set textwidth=100
set wrap            " this enables "visual" wrapping
"set paste
set magic " magic 기능 사용
set sol " 여러 가지 이동 동작시 줄의 시작으로 자동 이동
set sm " 새로 추가된 괄호의 짝을 보여주는 기능
"set pt=<Ins> " Insert 키로 paste 상태와 nopaste 상태를 전환한다.
set ls=2 " 항상 status 라인을 표시하도록 함.
set lsp=1
set nospell spelllang=en

"cscope
set csprg=/usr/bin/cscope
set csto=0
set cst
set nrformats=alpha " increase number as decimal

filetype on

set nocsverb
if filereadable("./cscope.out")
	cs add ./cscope.out
else
   let cscope_file=findfile("cscope.out", ".;")
   let cscope_pre=matchstr(cscope_file, ".*/")
   "echo cscope_file
   if !empty(cscope_file) && filereadable(cscope_file)
      exe "cs add" cscope_file cscope_pre
   endif
endif
set csverb
set tags=./tags;/,tags;/
set tagbsearch

func! Csc()
	let csc = expand("<cword>")
	new
	exe "cs find c ".csc
	if getline(1) == " "
		exe "q!"
	endif
endfunc
nmap ,c :call Csc()<cr>

func! Build()
    if filereadable("./mk.sh")
	!./mk.sh -b
    else
	let mk_file=findfile("mk.sh", ".;")
	let mk_pre=matchstr(mk_file, ".*/")
	if !empty(mk_file) && filereadable(mk_file)
	    exe '!cd' mk_pre '&& bash' mk_file '-b'
	endif
    endif
endfunc
nmap <F5> :call Build()<cr>

syntax on

"if $LANG[0] == 'k' && $lang1=='0'
"set fileencoding=utf8
"endif

set fileencodings=utf8,euc-kr
au Bufenter *.\(cpp\) set et
au Bufenter *.\(py\) set et

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

colorscheme evening 


"======================== vundle setting ======================
set nocompatible
filetype off   " required

" set the runtime path to include Vundle and initialize

set rtp+=/home/lucid/.vim/bundle/Vundle.vim

call vundle#begin()

" alternatively, pass a path where Vundle should install plugins

"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.

" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub repo

Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html

Plugin 'L9'

" Git plugin not hosted on GitHub

Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)

" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.

" Pass the path to set the runtimepath properly.

Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" ======================  Plugins ===========================

" Vim에서 파일 탐색기를 사용할 수 있게 한다. - Nerd Tree

Plugin 'The-NERD-tree'

" Vim에서 자동완성 기능(Ctrl + P)을 키입력하지 않더라도 자동으로 나타나게 - AutoComplPop

Plugin 'AutoComplPop'

" 열려있는 소스파일의 클래스, 함수, 변수 정보 창 - Tag List

Plugin 'taglist-plus'

Plugin 'srcexpl'

Plugin 'snipMate'

Plugin 'trailing-whitespace'

Plugin 'vim-airline/vim-airline'

Plugin 'vim-airline/vim-airline-themes'

Plugin 'Conque-Shell'

Plugin 'chrisbra/vim-diff-enhanced'


" ====================== End of Plugins ======================

" All of your Plugins must be added before the following line

call vundle#end()            " required

filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:

"filetype plugin on

"

" Brief help

" :PluginList       - lists configured plugins

" :PluginInstall    - installs plugins; append `!` to update or just

" :PluginUpdate

" :PluginSearch foo - searches for foo; append `!` to refresh local cache

" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

"

" see :h vundle for more details or wiki for FAQ


" ===================== NERD Tree, Tlist ======================
" NERD Tree를 왼쪽에 생성
"
let NERDTreeWinPos = "left"

" NERD Tree는 F7키. Tag List는 F8키에 매칭.

nmap <F7> :NERDTreeToggle<CR>

nmap <F8> :TlistToggle<CR>

filetype on

" Tag list가 사용하는 ctags의 경로 설정

let Tlist_Ctags_Cmd = "/usr/bin/ctags"

let Tlist_Inc_Winwidth = 0

let Tlist_Exit_OnlyWindow = 0

let Tlist_Auto_Open = 0

" Tag list 창을 오른쪽으로 생성

" let Tlist_Use_Right_Window = 1

" ===================== airline ======================
"
set term=xterm-256color
set t_Co=256
let g:airline_theme="wombat"
let g:airline_powerline_fonts = 1
"let g:airline_theme='base16_apathy'
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#fnamemod = ':t'

" ==================== vim-diff-enhanced =============
"
