
set nocompatible   "关闭与Vi兼容
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

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

""""""""""""""""""""""""""""
" 环境设置
""""""""""""""""""""""""""""

"----------------
"    leader     "
"""""""""""""""""
" 设置 leader 键，例子为空号键 ; 等
let mapleader="," 

" general copy/paste.
" NOTE: y,p,P could be mapped by other key-mapping
map <unique> <leader>y "*y
map <unique> <leader>p "*p
map <unique> <leader>P "*P
map <unique> <leader>v <C-q> 
map <unique> <leader>wa :wall<cr>
map <unique> <leader>wf :w<cr>


" 普通模式把;映射成:
nnoremap ; :

set helplang=cn            "使用中文帮助文档
set encoding=utf-8        "查看utf-8格式的帮助文档
set fileencodings=utf-8,gbk,utf8    "支持打开gbk格式的文件
syntax enable    " 语法高亮 
syntax on        " 开启文件类型侦测

colorscheme desert  "设置窗口颜色 darkblue  
set cursorline "突出当前行

"set guifont=Bitstream\ Vera\ Sans\ Mono\ 12    "设置字体为Bitstream Vera Sans Mono 12大小
set guifont=Courier_New:h10:cANSI

set autoindent             "自动缩进
set cindent                "C自动缩进
set shiftwidth=4           "自动缩进空白字符个数
set softtabstop=4          "tab键的一个制表符，如果softtabstop=5,tabstop=4,则tab是1个制表符加1个空格的混合
set tabstop=4              "tab键的空格数
set expandtab              "使用空格代替tab 在写Makefile时需要有tab
set backspace=2            "设置退格键可用

set nu!                    "设置显示行号
"set wrap                  "设置自动换行
set nowrap                 "设置不自动换行
set noswapfile             " 
set nobackup               " 不生成备份文件
"set backupdir=d:\Vim\tmp  " 生成备份文件到指定地方
set hidden                 " 允许在未保存修改时切换缓冲区
set showcmd                " 显示命令

"使用 tab 替换 %
nnoremap <tab> %
vnoremap <tab> %

"搜索输入全小写不分大小写 输入1或1个以上区分大小写 
set ignorecase
set smartcase

"根据窗口大小自动换行
"set wrap
"set textwidth=79
"set formatoptions=qrn1

"在第85个字符的位置显示了一个高亮列
set colorcolumn=85

"折叠
set fdm=marker              " 标记折叠方法
"set fdm=indent              " 缩进折叠方法
set fdm=syntax              " 启动时开启折叠功能
"set foldenable              " 开始折叠
"set foldlevelstart=99       " 打开文件是默认不折叠代码
"setlocal foldlevel=1        " 设置折叠层数为


"启动最大化窗口
function! MaximizeWindow()    
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction

"set guioptions-=m " 隐藏菜单栏 
set guioptions-=T " 隐藏工具栏 
"set guioptions-=L " 隐藏左侧滚动条 
"set guioptions-=r " 隐藏右侧滚动条 
"set guioptions-=b " 隐藏底部滚动条 
"set showtabline=0 " 隐藏Tab栏

if has('win32')    
    au GUIEnter * simalt ~x
else    
    au GUIEnter * call MaximizeWindow()
endif 



"autocmd FileType python set omnifunc=python3complete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType c set omnifunc=ccomplete#Complete
""""""""""""""""""""""""""""
"解决中文乱码
""""""""""""""""""""""""""""
set fileencodings=utf-8,chinese,latin-1
if has("win32")
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码
language messages zh_CN.utf-8

""""""""""""""""""""""""""""
"A    头/源文件切换
""""""""""""""""""""""""""""
    ":A :AS :AV 头/源文件切换,窗口分为左右两个窗口，并打开.h/.c文件
nnoremap <silent> <F9> :AV<cr>
let g:alternateSearchPath = 'sfr:./,sfr:../include,sfr:http://www.cnblogs.com/include,sfr:../source,sfr:../src,sfr:../inc'

""""""""""""""""""""""""""""
"tags
""""""""""""""""""""""""""""
set tags=tags;
set autochdir

map <C-F12> <ESC>:call Do_CsTag()<cr>
""""""""""""""""""""""""""""
"winmannger
""""""""""""""""""""""""""""
"配置taglist
let Tlist_Show_One_File=1 
let Tlist_Exit_OnlyWindow=1
"配置FileExplorer
let g:winManagerWindowLayout='FileExplorer|TagList'  "将winmanager设置成浏览器和TagList的组合
"let g:winManagerWindowLayout='TagList'  "将winmanager设置成浏览器和TagList的组合
    "映射winmanager的快捷键
nmap wm :WMToggle<cr>
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

nmap wn :vertical res 50<cr>
nmap wb :vertical res 100<cr> 

""""""""""""""""""""""""""""
"多文档顶部标签栏编辑
""""""""""""""""""""""""""""
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapWindowsNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplorerMoreThanOne=1



""""""""""""""""""""""""""""
"cscope
"""""""""""""""""""""""""""""
"自动生成cscope.out并导入
function! Do_CsTag()
    if(has('win32'))
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
    silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q"
    ":'0  "使用书签跳转到上次退出时的地方
endfunction

function! Disable_cscope()
    cs kill -1
endfunction

"==
" windowdir
"  Gets the directory for the file in the current window
"  Or the current working dir if there isn't one for the window.
"  Use tr to allow that other OS paths, too
function s:windowdir()
  if winbufnr(0) == -1
    let unislash = getcwd()
  else 
    let unislash = fnamemodify(bufname(winbufnr(0)), ':p:h')
  endif
    return tr(unislash, '\', '/')
endfunc
"
"==
" Find_in_parent
" find the file argument and returns the path to it.
" Starting with the current working dir, it walks up the parent folders
" until it finds the file, or it hits the stop dir.
" If it doesn't find it, it returns "Nothing"
function s:Find_in_parent(fln,flsrt,flstp)
  let here = a:flsrt
  while ( strlen( here) > 0 )
    if filereadable( here . "/" . a:fln )
      return here
    endif
    let fr = match(here, "/[^/]*$")
    if fr == -1
      break
    endif
    let here = strpart(here, 0, fr)
    if here == a:flstp
      break
    endif
  endwhile
  return "Nothing"
endfunc

function! Connect_cscope()
    let csdbpath = s:Find_in_parent("cscope_bak.out",s:windowdir(),$HOME)
    exe "cs add " . csdbpath . "/cscope_bak.out " . csdbpath
    "cs add cscope_bak.out
"更新ctags
"silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q"
endfunction

"映射cscope的快捷键
"nmap <F5>s :cs find s <C-R>=expand("<cword>")<CR><CR>  "查找函数名、宏、枚举值等出现的地方
"nmap <F5>g :cs find g <C-R>=expand("<cword>")<CR><CR>  "查找函数、宏、枚举等定义的位置
"nmap <F5>c :cs find c <C-R>=expand("<cword>")<CR><CR>  "查找本函数调用的函数
"nmap <F5>t :cs find t <C-R>=expand("<cword>")<CR><CR>  "查找调用本函数的函数
"nmap <F5>e :cs find e <C-R>=expand("<cword>")<CR><CR>  "查找指定的字符串
"nmap <F5>f :cs find f <C-R>=expand("<cfile>")<CR><CR>  "查找egrep模式
"nmap <F5>i :cs find i <C-R>=expand("<cfile>")<CR>$<CR> "查找并打开文件
"nmap <F5>d :cs find d <C-R>=expand("<cword>")<CR><CR>  "查找包含本文件的文件

nmap <unique> <leader>fs :cs find s <C-R>=expand("<cword>")<CR><CR>  "查找函数名、宏、枚举值等出现的地方
nmap <unique> <leader>fg :cs find g <C-R>=expand("<cword>")<CR><CR>  "查找函数、宏、枚举等定义的位置
nmap <unique> <leader>fc :cs find c <C-R>=expand("<cword>")<CR><CR>  "查找本函数调用的函数
nmap <unique> <leader>ft :cs find t <C-R>=expand("<cword>")<CR><CR>  "查找调用本函数的函数
nmap <unique> <leader>fe :cs find e 
nmap <unique> <leader>ff :cs find f 
nmap <unique> <leader>fi :cs find i <C-R>=expand("<cfile>")<CR>$<CR> "查找并打开文件
nmap <unique> <leader>fd :cs find d <C-R>=expand("<cword>")<CR><CR>  "查找包含本文件的文件

"设定使用quickfix窗口来显示cscope的结果
set cscopequickfix=s-,c-,d-,i-,t-,e-    

""""""""""""""""""""""""""""
"映射QuickFix的快捷键
"""""""""""""""""""""""""""""
nmap <F8>   :cn<cr>        "前一项
nmap <F7>   :cp<cr>        "后一项

"nmap <leader>co :QFix<CR>
"F6 开关QuickFix窗口
nmap <F6> :call QFixToggle(1)<CR>
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

""""""""""""""""""""""""""""
"lookupfile setting
"""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength           = 2 "最少输入2个字符开始匹配
let g:LookupFile_PreserveLastPattern    = 0 "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1 "保存查找历史
let g:LookupFile_AlwaysAcceptFirst      = 1 "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles          = 0 "不允许创建不存在的文件

"查找文件名及包含出现字符串的文件
nmap <silent> <leader>lf :LUTags<cr>
"查找已打开的buffer字符名
nmap <silent> <leader>ll :LUBufs<cr>
"指定目录结构查找
nmap <silent> <leader>lw :LUWalk<cr>

" close lookupfile window by two <Esc>
"nnoremap <Esc><Esc> <C-W>q
"inoremap <Esc><Esc> <Esc><C-W>q 

""""""""""""""""""""""""""""
"配置python解释器
"""""""""""""""""""""""""""""
autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"  
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m  
autocmd BufRead *.py nmap <F3> :!python %<CR>  
"autocmd BufRead *.py nmap <F3> :!python main.py<CR>  
autocmd BufRead *.py nmap <F4> :make<CR>  
"autocmd BufRead *.py copen "如果是py文件，则同时打开编译信息窗口 

set filetype=python
au BufNewFile,BufRead *.py,*.pyw setf python

"---------------------------
" 我的快捷操作
""""""""""""""""""""""""""""

"----------------
"    nmap       "
"""""""""""""""""
" Esc 清除搜索高亮
nnoremap <esc> :noh<return><esc>


"----------------
"    imap       "
"""""""""""""""""
" 插入模式返回Norm
imap kk <ESC>


""""""""""""""""""""""""""""
"自动补全 ( { [ " '
"""""""""""""""""""""""""""""
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

""""""""""""""""""""""""""""
"缩写  ab所有 iab插入 cab命令 #d<Space>
"""""""""""""""""""""""""""""
iabbrev #d #define 
iabbrev #i #ifdef
iabbrev vo volatile
iabbrev con  continue

""""""""""""""""""""""""""""
"在matchit.vim添加 verilog语言成对标签跳转
"""""""""""""""""""""""""""""
source $VIMRUNTIME/macros/matchit.vim

