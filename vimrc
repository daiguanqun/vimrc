set rtp+=~/.vim/bundle/vundle/
set nocompatible   " 与vi不兼容
call vundle#rc()
filetype off

Bundle 'gmarik/vundle'
Bundle 'Auto-Pairs'
Bundle 'FencView.vim'
Bundle 'Gundo'
Bundle 'LargeFile'
Bundle 'UltiSnips'
Bundle 'The-NERD-Commenter'
Bundle 'The-NERD-tree'
Bundle 'ctrlp.vim'
Bundle 'matchit.zip'
Bundle 'mru.vim'
Bundle 'EasyMotion'
Bundle 'minibufexpl.vim'
Bundle 'Pydiction'
Bundle 'pydoc.vim'
Bundle 'pyflakes.vim'
Bundle 'python.vim'
Bundle 'python.vim--Vasiliev'
Bundle 'surround.vim'
Bundle 'jshint.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'taglist.vim'
Bundle 'WinManager'

let g:pydiction_location="~/.vim/bundle/Pydiction/complete-dict"

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=1

let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne=0

let g:bufExplorerMaxHeight=50
let g:NERDTree_title="[NERDTree]"
let g:winManagerWindowLayout="NERDTree|TagList"
let g:persistentBehavior=1
let g:AutoOpenWinManager=1

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

"自动退出Winmanager
autocmd bufenter * if (winnr("$") == 3 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary")  | qa | endif

function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

set history=1024   " 历史记录最高数目
filetype plugin on           " 针对不同的文件类型加载对应的插件
filetype indent on           " 启用自动补全
set autoread       " 文件更新时重新读取
set mouse=a  " 所有模式下都可以用鼠标
"set selectmode=mouse,key " 鼠标和shift加特殊键选区算选择模式，不是可视模式
set clipboard=unnamed,autoselect "选择剪贴板
set nobackup   " 取消自动备份
set backupext=.bak   " 自动备份文件后缀
set autochdir " 设定文件浏览器目录为当前目录
set foldmethod=manual        " 选择代码折叠类型
set nopaste " 粘贴时保留原有格式 --> 关闭了，不然autoclose不能自动补全括号
set wildignore=*.o,*~,*.pyc  "打开文件、补全文件等时忽略提示这些后缀的文件
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.neocon/*
set tags=./tags;/,tags,./**/tags "查找tags文件路径

"" 配置不同操作系统时需要的变量
"if has("win32")
"    "let g:_vimfiles = $VIM."/vimfiles"
"    "let g:_vimrc = $VIM."/_vimrc"
"    let g:_vimfiles = "~/.vim"
"    let g:_vimrc = "~/.vimrc"
"else
"    let g:_vimfiles = "~/.vim"
"    let g:_vimrc = "~/.vimrc"
"endif

"" windows上如果装了cygwin，设置shell为mintty
"if has("win32")
"  if filereadable("D:/cygwin/bin/mintty.exe")
"    set shell=D:/cygwin/bin/mintty.exe
"    set shellcmdflag=-i\ /Cygwin-Terminal.ico\ -
"  endif
"endif

" 记录上次打开文件位置
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
set viminfo^=%
set cc=0  " 不高亮任何列
set showcmd " 显示输入的字符
set mousehide " 默认不显示鼠标
set so=3 " 移动时光标最多离底部3行
set ruler " 显示行号和列号
set wildmenu " 加强命令行自动补全
set cmdheight=1 " 命令行占1行
set nu " 显示行号
set lazyredraw " 减少重绘
set hid " 放弃缓冲区时隐藏而不卸载
set backspace=eol,start,indent
set whichwrap=b,s,<,>,[,] " 使指定的左右移动光标的键在行首或行尾可以移到前一行或者后一行
set ignorecase "搜索时忽略大小写
set smartcase " 如果关键字里有大小写就严格匹配
set incsearch " 搜索时动态调到第一个匹配的位置
set wrapscan " 搜索到文件末时循环到第一个搜索结果
set magic
set showmatch " 括号匹配暂时跳转
set mat=2 " 配对符号高亮"
set hlsearch " 高亮搜索匹配的结果
"set showbreak=->   "折行符
"set showbreak=?   "折行符
let &showbreak = '?  '

try
    set switchbuf=usetab " 打开缓冲时在原来的窗口打开
    set stal=1 " 至少有两个标签页时才显示标签栏
catch
endtry

" 每行超过80个的字符用下划线标示
au BufRead,BufNewFile *.asm,*.c,*.cpp,*.java,*.cs,*.sh,*.lua,*.pl,*.pm,*.py,*.rb,*.erb,*.hs,*.vim,*.php 2match Underlined /.\%81v/

au BufNewFile,BufRead *.jce set filetype=cpp
au BufNewFile,BufRead *.proto set filetype=proto

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码与换行
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ambiwidth=double " 使用 US-ASCII 字符两倍的宽度，帮助识别CJK
set fo+=mB " formatoptions
set ffs=unix,dos,mac " 文件格式支持
set encoding=utf-8 " Vim内部使用编码
" 编码识别顺序
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" 不同终端使用编码不同
if has("win32")
    set termencoding=gbk
else
    set termencoding=utf-8
endif

" 提示和菜单使用中文
set langmenu=zh_CN.UTF-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8


""""""""""""""""""""""""""""""
" 状态栏设置，有了powerline不再使用
""""""""""""""""""""""""""""""
set laststatus=2 "状态栏有两行
set statusline=\     "初始化为一个空格
set statusline+=%m   "是否被修改
set statusline+=%r   "是否是只读
set statusline+=%h   "是否是帮助文档
set statusline+=%w   "是否是预览窗口
set statusline+=\ %<%F   "文件路径
"set statusline+=\ \ %<%{getcwd()} "显示当前工作目录,%<表示过长就从该位置收缩
set statusline+=\ %=\    "右对齐
set statusline+=[%{strlen(&ft)?&ft:'none'} "文件类型
set statusline+=,\ %{strlen(&fenc)?&fenc:'none'} "文件类型
"set statusline+=,\ %{&fileencoding}  "文件编码
set statusline+=,\ %{&fileformat}]  "文件格式
set statusline+=\ \ %l/%L:%c  "行号\总行号:列号
set statusline+=\ \ %b-0x%B\   "字符十进制和十六进制的ASCII值

"set rulerformat=%30(%=%m%r%h%w\ %p%%\ %l:%v\ %{(&fenc!=''?&fenc:&enc).(&ff!='unix'?','.&ff:'')}%<%)
"set statusline=%<%F\ %m%r%h%w%=%p%%\ %l:%v\ %{(&fenc!=''?&fenc:&enc).(&ff!='unix'?','.&ff:'')}
set fillchars=stl:-,stlnc:-
hi StatusLine guifg=orange guibg=NONE gui=none ctermfg=166 ctermbg=none cterm=none term=none
hi StatusLineNC guifg=grey guibg=NONE gui=none ctermfg=grey ctermbg=none cterm=none term=none
"""""""""""""""""""""""""""""""
" 设置缩进
""""""""""""""""""""""""""""""
set expandtab " 插入tab时换成合适数量的空格
set shiftwidth=4 " 缩进一步使用的空格数目
set smarttab " 行首的tab用合适的空白符代替
set tabstop=4 " 文件里tab代表的空格数
set lbr " 打开linebreak
set tw=0 " textwidth, 一行的最大宽度
set list " 显示不可见字符"
"set lcs=tab:?-,trail:? " tab用+---显示，行末空格用-显示
set lcs=tab:+-,trail:- " tab用+---显示，行末空格用-显示
set ai " autoindent 按语法自动缩进
set si " smartindent 开启新行时自动缩进
set cindent " 按C的语法缩进
set wrap  " 到屏幕边会回绕
syntax enable " 语法高亮
set guifont=Monaco:h13       " 字体 && 字号

if has("gui_running")
    set guioptions= " 菜单栏、工具栏等都不要了
    au GUIEnter * simalt ~x  " 窗口启动时自动最大化
    let psc_style='cool'
    colorscheme molokai
    "colorscheme blackboard       " 着色模式
    "colorscheme torte
    "colorscheme desert
else
    set background=dark
    "colorscheme darkburn       " 着色模式
    "colorscheme torte
    "colorscheme desert
    colorscheme molokai
endif

" 设置当前行当前列高亮
if has("gui_running")
    set cursorline
    set cursorcolumn
    hi cursorline guibg=#191E2F
    hi CursorColumn guibg=#191E2F
else
    set nocursorline
    set nocursorcolumn
    "hi cursorline ctermbg=LightMagenta
    "hi CursorColumn ctermbg=LightMagenta
endif

if &term =~ "xterm"
  " 256位色
  let &t_Co=256
  " 退出后恢复现场
  set t_ti=ESC7ESC[rESC[?47h t_te=ESC[?47lESC8
  if has("terminfo")
    let &t_Sf="\ESC[3%p1%dm"
    let &t_Sb="\ESC[4%p1%dm"
  else
    let &t_Sf="\ESC[3%dm"
    let &t_Sb="\ESC[4%dm"
  endif
endif

highlight Pmenu ctermbg=31
highlight SpellBad cterm=undercurl,bold ctermbg=0

"快捷键
map <C-S> <Esc>:w<CR>
" 空格翻页比较符合习惯
map <Space> <C-D>

map <F5> <Esc>:w<CR>:!%<CR>

nmap <F12> <Esc>:!ctags -R *<CR>
nmap <F8> <Esc>:WMToggle<CR>

let $JS_CMD='node'
