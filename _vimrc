"------------------------------------------------
"   < 判断操作系统是否是 Windows 还是 Linux >
"""""""""""""""""""""""""""""""""""""""""""""""""
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:iswindows = 0
endif

"------------------------------------------------
"  < 判断是终端还是 Gvim >
"""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

"------------------------------------------------
" < Vundle >
"""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

"指向Vundle脚本插件$VIM/vimfiles/bundle/Vundle.vim/
set rtp+=$VIM/vimfiles/bundle/Vundle.vim/

"指向Vundle自动下载安装插件到$USERPROFILE/vimfiles/bundle/目录"
call vundle#begin('$USERPROFILE/vimfiles/bundle/')

"------------------------------------------------
"vimwiki
"""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'vimwiki/vimwiki'

"按F4转为html, <leader>whh 用浏览器打开
let g:vimwiki_table_auto_fmt = 0
let g:vimwiki_CJK_length = 1 
let g:vimwiki_camel_case = 0 
let g:vimwiki_use_mouse = 1

if 0
    Plugin 'JamshedVesuna/vim-markdown-preview'
    let g:vimwiki_list = [{'path': 'D:/vimwiki/',
                         \ 'path_html': 'D:/vimwiki/',
                         \ 'syntax': 'markdown', 'ext': '.md',
                         \ 'html_header': 'D:/vimwiki/template/header.tpl',}] 
else
    let wiki = {}
    "设定vimwiki的路径
    let wiki.path = 'D:/vimwiki/'
    "设定html代码的路径
    let wiki.path_html = 'D:/vimwiki/'
    "保存自动添加更新目录
    let wiki.auto_toc = 1
    let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'c': 'c'}
    let g:vimwiki_list = [wiki]
    "let g:vimwiki_browsers=['C:\Program Files\internet explorer\iexplore.exe']
    map <F4> :Vimwiki2HTML<cr>
    map <S-F4> :VimwikiAll2HTML<cr>
    map <Leader>tt <Plug>VimwikiToggleListItem
endif

"------------------------------------------------
"自动补全 ( { [ " '
"""""""""""""""""""""""""""""""""""""""""""""""""
if 0
    Plugin 'jiangmiao/auto-pairs'
else
    function! AutoPair(open, close)
      let line = getline('.')
      if col('.') > strlen(line) || line[col('.') - 1] == ' '
        return a:open.a:close."\<ESC>i"
      else
        return a:open
      endif
    endf

    function! ClosePair(char)
        if getline('.')[col('.') - 1] == a:char
            return "\<Right>"
        else
            return a:char
        endif
    endfunction

    "自动补全条件:一是光标在行末 二是光标下一个字符是空格
    :inoremap ( <c-r>=AutoPair('(', ')')<CR>
    :inoremap ) <c-r>=ClosePair(')')<CR>
    :inoremap { {<CR>}<ESC>O
    :inoremap } <c-r>=ClosePair('}')<CR>
    :inoremap [ []<ESC>i
    :inoremap ] <c-r>=ClosePair(']')<CR>
    :inoremap " ""<ESC>i
    :inoremap ' ''<ESC>i

    :vnoremap $( <esc>`>a)<esc>`<i(<esc>
    :vnoremap $[ <esc>`>a]<esc>`<i[<esc>
    :vnoremap ${ <esc>`>a}<esc>`<i{<esc>
    :vnoremap $" <esc>`>a"<esc>`<i"<esc>
    :vnoremap $' <esc>`>a'<esc>`<i'<esc>
endif

"------------------------------------------------
"a.vim    切换"F9 却换.h 与 .c文件
"""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'a.vim'

":A :AS :AV 头/源文件切换,窗口分为左右两个窗口，并打开.h/.c文件
nnoremap <silent> <F9> :AV<cr>
let g:alternateSearchPath = 'sfr:./,sfr:../include,sfr:http://www.cnblogs.com/include,sfr:../source,sfr:../src,sfr:../inc'

"------------------------------------------------
"minibufexplpp.vim 多文档顶部标签栏编辑
"""""""""""""""""""""""""""""""""""""""""""""""""
" 使用会出现多个标签栏 严重影响体验
if 0
    Plugin 'minibufexpl.vim'
    "操作:<C-Tab>前一项 <C-Shift-Tab>后一项 :Nb快速打开指定编号N文件
    let g:miniBufExplMapWindowNavArrows = 1
    "let g:miniBufExplMapWindowNavVim = 1
    "let g:miniBufExplMapCTabSwitchbufs = 1
    let g:miniBufExplModSelTarget = 1
    "解决FileExplorer窗口变小问题
    let g:miniBufExplForceSyntaxEnable = 1
    let g:miniBufExplorerMoreThanOne = 2
endif

"------------------------------------------------
"winmannger.vim
"""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'winmanager'

"配置FileExplorer
let g:winManagerWindowLayout='FileExplorer|TagList'  "将winmanager设置成浏览器和TagList的组合
"映射winmanager的快捷键
nmap wm :WMToggle<cr>

"------------------------------------------------
"tags.exe 文件列表
"""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'taglist.vim'

set tags=tags;
set autochdir
"配置taglist
let Tlist_Show_One_File=1 
let Tlist_Exit_OnlyWindow=1

"------------------------------------------------
"lookupfile.vim genutils.vim
"""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'genutils'
Plugin 'lookupfile'

let g:LookupFile_MinPatLength           = 2 "最少输入2个字符开始匹配
let g:LookupFile_PreserveLastPattern    = 0 "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1 "保存查找历史
let g:LookupFile_AlwaysAcceptFirst      = 1 "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles          = 0 "不允许创建不存在的文件

"查找文件名及包含出现字符串的文件
nmap <silent> ,lf :LUTags<cr>
"查找已打开的buffer字符名
nmap <silent> ,ll :LUBufs<cr>
"指定目录结构查找
nmap <silent> ,lw :LUWalk<cr>
",lf 根据文件内容信息打开文件

"------------------------------------------------
"
"""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'grep.vim'
Plugin 'Mark'
"Plugin 'visualmark'

"------------------------------------------------
"ctasg.exe cscope.exe
"""""""""""""""""""""""""""""""""""""""""""""""""
"将ctasg.exe cscope.exe 拷贝到vimxx目录下
"Plugin 'ctags.exe'
"Plugin 'cscope'

call vundle#end() 
filetype plugin indent on
""""""""End Vundle"""""""""""""""""""""""""""""""

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin "保留Win下Ctrl + C、 Ctrl + V、 Ctrl + X 和 Ctrl + Z

set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"autocmd FileType python set omnifunc=python3complete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType c set omnifunc=ccomplete#Complete

"------------------------------------------------
" 环境设置
"""""""""""""""""""""""""""""""""""""""""""""""""
set autoread               " 设置当文件被改动时自动载入  
set guioptions-=m          " 隐藏菜单栏 
set guioptions-=T          " 隐藏工具栏 
set guioptions-=L          " 隐藏左侧滚动条 
set guioptions-=r          " 隐藏右侧滚动条 
"set guioptions-=b        " 隐藏底部滚动条 
"set showtabline=0        " 隐藏Tab栏
set autoindent             " 自动缩进
set cindent                " C自动缩进
set shiftwidth=4           " 自动缩进空白字符个数
set softtabstop=4          " tab键的一个制表符，如果softtabstop=5,tabstop=4,则tab是1个制表符加1个空格的混合
set tabstop=4              " tab键的空格数
set expandtab              " 使用空格代替tab 在写Makefile时需要有tab
set backspace=2            " 设置退格键可用
set nu!                   " 设置显示行号
set relativenumber        " 相对行号"
"set wrap                 " 设置自动换行
set nowrap                 " 设置不自动换行
set noundofile
set noswapfile             " 
set nobackup               " 不生成备份文件
"set backupdir=d:\Vim\tmp " 生成备份文件到指定地方
set hidden                 " 允许在未保存修改时切换缓冲区
set showcmd                " 显示命令
set nocompatible           " 关闭与Vi兼容
"set display=lastline
set helplang=cn            " 使用中文帮助文档
set encoding=utf-8         " 查看utf-8格式的帮助文档
set fileencodings=utf-8,gbk,utf8    "支持打开gbk格式的文件
syntax enable              " 语法高亮 
syntax on                  " 开启文件类型侦测
set ignorecase smartcase   "搜索输入全小写不分大小写 输入1或1个以上区分大小写 
colorscheme peaksea         "设置窗口颜色
set gfn=IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
"set gfw=幼圆:h10.5:cGB2312:qDRAFT "设置无效

"开启高亮光标----列
"set cursorcolumn
"hi CursorColumn cterm=NONE ctermbg=#000000 ctermfg=white guibg=darkred guifg=white

"开启光亮光标----行
set cursorline
"hi CursorLine  guibg=black

"列界线
set colorcolumn=85         " 在第85个字符的位置显示了一个高亮列
hi colorcolumn guibg=DarkRed

"------------------------------------------------
"折叠 za zM(zi)
"""""""""""""""""""""""""""""""""""""""""""""""""
"set fdm=marker            " 标记折叠方法
"set fdm=indent            " 缩进折叠方法
set fdm=syntax            " 语法折叠方法
set foldenable            " 开始折叠
set foldlevelstart=99     " 打开文件是默认不折叠代码
setlocal foldlevel=1      " 设置折叠层数为


"------------------------------------------------
"启动最大化窗口
"""""""""""""""""""""""""""""""""""""""""""""""""
function! MaximizeWindow()    
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction

if g:iswindows
    au GUIEnter * simalt ~x
else    
    au GUIEnter * call MaximizeWindow()
endif 


"------------------------------------------------
"解决中文乱码
"""""""""""""""""""""""""""""""""""""""""""""""""
set fileencodings=utf-8,chinese,latin-1
if g:iswindows
    set fileencoding=chinese
    "set fileencoding=utf-8
else
    set fileencoding=utf-8
endif
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码
language messages zh_CN.utf-8


"------------------------------------------------
"cscope.exe
"""""""""""""""""""""""""""""""""""""""""""""""""
"自动生成cscope.out并导入
function! Do_CsTag()
    if g:iswindows
        " 使用全局标记当前位置到Z (取巧点:使用全局标记)
        execute "ma Z"
        " 跳转编号1的.vim文件 *.vim必须保证编号1文件 (取巧点:1b)
        execute "1b"
        " 断开cscope.out连接    
        execute "cs kill -1"
        "silent! execute "!dir /b *.c,*.cpp,*.h,*.py,*.cs >> cscope.files"
        silent! execute "!dir /s /b *.h *.c *.py *.txt> cscope.files"
    else
        silent! execute "!find . -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.m" -o -name "*.mm" -o -name "*.java" -o -name "*.py" > cscope.files"
    endif
    silent! execute "!cscope -bC"
    if filereadable("cscope.out")
        execute "cs add cscope.out"
    endif
    "更新ctags
    "silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q" "win7正常 win10使用会跳转到h文件中

    "有些搜索不到 ???
    silent! execute "!ctags -R *"

    " 跳转全局标记位置Z
    execute "'Z"
endfunction

map <C-F12> <ESC>:call Do_CsTag()<cr>

nmap <unique> ,fs :cs find s <C-R>=expand("<cword>")<CR><CR>"查找函数名、宏、枚举值等出现的地方
nmap <unique> ,fg :cs find g <C-R>=expand("<cword>")<CR><CR>"查找函数、宏、枚举等定义的位置
nmap <unique> ,fc :cs find c <C-R>=expand("<cword>")<CR><CR>"查找本函数调用的函数
nmap <unique> ,ft :cs find t <C-R>=expand("<cword>")<CR><CR>"查找调用本函数的函数
nmap <unique> ,fe :cs find e 
nmap <unique> ,ff :cs find f 
nmap <unique> ,fi :cs find i <C-R>=expand("<cfile>")<CR>$<CR>"查找并打开文件
nmap <unique> ,fd :cs find d <C-R>=expand("<cword>")<CR><CR>"查找包含本文件的文件

"设定使用quickfix窗口来显示cscope的结果
set cscopequickfix=s-,c-,d-,i-,t-,e-    

"------------------------------------------------
"映射QuickFix的快捷键
"""""""""""""""""""""""""""""""""""""""""""""""""
"F6 开关QuickFix窗口
nmap <F6> :call QFixToggle(1)<CR>
nmap <F7> :cp<cr>"后一项
nmap <F8> :cn<cr>"前一项

command! -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced != 0
        cclose
    else
        if exists("g:my_quickfix_win_height")
            execute "copen ".g:my_quickfix_win_height
        else
            copen
        endif
    endif
endfunction
augroup QFixToggle
    autocmd!
    autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
    autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END


"------------------------------------------------
"配置python解释器
"""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"  
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m  
autocmd BufRead *.py nmap <F3> :!python %<CR>  
"autocmd BufRead *.py nmap <F3> :!python main.py<CR>  
"autocmd BufRead *.py nmap <F4> :make<CR>  
"autocmd BufRead *.py copen "如果是py文件，则同时打开编译信息窗口 

set filetype=python
au BufNewFile,BufRead *.py,*.pyw setf python

"------------------------------------------------
"在matchit.vim添加 verilog语言成对标签跳转
"""""""""""""""""""""""""""""""""""""""""""""""""
source $VIMRUNTIME/macros/matchit.vim

"---------------------------
" 我的快捷操作
""""""""""""""""""""""""""""
"使用 tab 替换 %
nnoremap <tab> %
vnoremap <tab> %

"------------------------------------------------
" ,
"""""""""""""""""""""""""""""""""""""""""""""""""
" general copy/paste.
" NOTE: y,p,P could be mapped by other key-mapping
vmap <unique> ,y "*y
vmap <unique> ,p "*p
vmap <unique> ,P "*P
nmap <unique> ,y "*y
nmap <unique> ,p "*p
nmap <unique> ,P "*P
nmap <unique> ,v <C-q> 
nmap <unique> ,wa :wall<cr>
nmap <unique> ,wf :w!<cr>
nmap <unique> ,bin   :%!xxd -g 1<cr>
nmap <unique> ,char  :%!xxd -r<cr>
nmap <unique> ,ecfg  :ed $VIM/_vimrc<cr>
nmap <unique> ,scfg  :so $VIM/_vimrc<cr>

"------------------------------------------------
" Alt(M[eta]) key map
"""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <A-j> <ESC>:w!<cr>
nnoremap <A-j> <ESC>
vnoremap <A-j> <ESC>
nnoremap <A-l> e
vmap     <A-l> e
inoremap <A-l> <ESC>e
nnoremap <A-h> b
vmap     <A-h> b
inoremap <A-h> <ESC>b
nnoremap <A-y> yiw
nnoremap <A-p> viw"0p
cnoremap <A-h> <Left>
cnoremap <A-l> <Right>
cnoremap <A-j> <down>
cnoremap <A-k> <up>
"------------------------------------------------
" Ctrl key map
"""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-j> <C-f>
nnoremap <C-k> <C-b>
vnoremap <C-j> <C-f>
vnoremap <C-k> <C-b>

"调节窗口大小
nmap <C-h> :vertical res+1<cr>
nmap <C-l> :vertical res-1<cr>

"------------------------------------------------
"    nmap
"""""""""""""""""""""""""""""""""""""""""""""""""
" Esc 清除搜索高亮
nnoremap <esc> :noh<return><esc>

"窗口操作的快捷键
    "垂直分割当前窗口
nmap wv        <C-w>v
    "水平分割当前窗口
nmap ws        <C-w>s
    "关闭当前窗口
nmap wc        <C-w>c
nmap wh        <C-w>h
nmap wj        <C-w>j
nmap wk        <C-w>k
nmap wl        <C-w>l
nmap wo        <C-w>o

"------------------------------------------------
" ab 所以模式
"""""""""""""""""""""""""""""""""""""""""""""""""

"------------------------------------------------
" iab 编辑模式
"""""""""""""""""""""""""""""""""""""""""""""""""
iabbrev #d #define
iabbrev #i #ifdef
iabbrev vo volatile
iabbrev con  continue

"插入模式 获取插入时间 xtime
iab xtime <c-r>=strftime("%Y-%m-%d %H:%M:%S")

"------------------------------------------------
" cab 命令模式
"""""""""""""""""""""""""""""""""""""""""""""""""
cab path/\ s/\//\\/g
cab path\/ s/\\/\//g

"------------------------------------------------
" 项目配置文件 加载 
"""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable("Prj.vim")
    source Prj.vim
endif 

