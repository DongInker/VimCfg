"------------------------------------------------
"   < �жϲ���ϵͳ�Ƿ��� Windows ���� Linux >
"""""""""""""""""""""""""""""""""""""""""""""""""
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:iswindows = 0
endif

"------------------------------------------------
"  < �ж����ն˻��� Gvim >
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

"ָ��Vundle�ű����$VIM/vimfiles/bundle/Vundle.vim/
set rtp+=$VIM/vimfiles/bundle/Vundle.vim/

"ָ��Vundle�Զ����ذ�װ�����$USERPROFILE/vimfiles/bundle/Ŀ¼"
call vundle#begin('$USERPROFILE/vimfiles/bundle/')

"------------------------------------------------
"vimwiki
"""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'vimwiki/vimwiki'

"��F4תΪhtml, <leader>whh ���������
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
    "�趨vimwiki��·��
    let wiki.path = 'D:/vimwiki/'
    "�趨html�����·��
    let wiki.path_html = 'D:/vimwiki/'
    "�����Զ���Ӹ���Ŀ¼
    let wiki.auto_toc = 1
    let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'c': 'c'}
    let g:vimwiki_list = [wiki]
    "let g:vimwiki_browsers=['C:\Program Files\internet explorer\iexplore.exe']
    map <F4> :Vimwiki2HTML<cr>
    map <S-F4> :VimwikiAll2HTML<cr>
    map <Leader>tt <Plug>VimwikiToggleListItem
endif

"------------------------------------------------
"�Զ���ȫ ( { [ " '
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

    "�Զ���ȫ����:һ�ǹ������ĩ ���ǹ����һ���ַ��ǿո�
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
"a.vim    �л�"F9 ȴ��.h �� .c�ļ�
"""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'a.vim'

":A :AS :AV ͷ/Դ�ļ��л�,���ڷ�Ϊ�����������ڣ�����.h/.c�ļ�
nnoremap <silent> <F9> :AV<cr>
let g:alternateSearchPath = 'sfr:./,sfr:../include,sfr:http://www.cnblogs.com/include,sfr:../source,sfr:../src,sfr:../inc'

"------------------------------------------------
"minibufexplpp.vim ���ĵ�������ǩ���༭
"""""""""""""""""""""""""""""""""""""""""""""""""
" ʹ�û���ֶ����ǩ�� ����Ӱ������
if 0
    Plugin 'minibufexpl.vim'
    "����:<C-Tab>ǰһ�� <C-Shift-Tab>��һ�� :Nb���ٴ�ָ�����N�ļ�
    let g:miniBufExplMapWindowNavArrows = 1
    "let g:miniBufExplMapWindowNavVim = 1
    "let g:miniBufExplMapCTabSwitchbufs = 1
    let g:miniBufExplModSelTarget = 1
    "���FileExplorer���ڱ�С����
    let g:miniBufExplForceSyntaxEnable = 1
    let g:miniBufExplorerMoreThanOne = 2
endif

"------------------------------------------------
"winmannger.vim
"""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'winmanager'

"����FileExplorer
let g:winManagerWindowLayout='FileExplorer|TagList'  "��winmanager���ó��������TagList�����
"ӳ��winmanager�Ŀ�ݼ�
nmap wm :WMToggle<cr>

"------------------------------------------------
"tags.exe �ļ��б�
"""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'taglist.vim'

set tags=tags;
set autochdir
"����taglist
let Tlist_Show_One_File=1 
let Tlist_Exit_OnlyWindow=1

"------------------------------------------------
"lookupfile.vim genutils.vim
"""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'genutils'
Plugin 'lookupfile'

let g:LookupFile_MinPatLength           = 2 "��������2���ַ���ʼƥ��
let g:LookupFile_PreserveLastPattern    = 0 "�������ϴβ��ҵ��ַ���
let g:LookupFile_PreservePatternHistory = 1 "���������ʷ
let g:LookupFile_AlwaysAcceptFirst      = 1 "�س��򿪵�һ��ƥ����Ŀ
let g:LookupFile_AllowNewFiles          = 0 "�������������ڵ��ļ�

"�����ļ��������������ַ������ļ�
nmap <silent> ,lf :LUTags<cr>
"�����Ѵ򿪵�buffer�ַ���
nmap <silent> ,ll :LUBufs<cr>
"ָ��Ŀ¼�ṹ����
nmap <silent> ,lw :LUWalk<cr>
",lf �����ļ�������Ϣ���ļ�

"------------------------------------------------
"
"""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'grep.vim'
Plugin 'Mark'
"Plugin 'visualmark'

"------------------------------------------------
"ctasg.exe cscope.exe
"""""""""""""""""""""""""""""""""""""""""""""""""
"��ctasg.exe cscope.exe ������vimxxĿ¼��
"Plugin 'ctags.exe'
"Plugin 'cscope'

call vundle#end() 
filetype plugin indent on
""""""""End Vundle"""""""""""""""""""""""""""""""

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin "����Win��Ctrl + C�� Ctrl + V�� Ctrl + X �� Ctrl + Z

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
" ��������
"""""""""""""""""""""""""""""""""""""""""""""""""
set autoread               " ���õ��ļ����Ķ�ʱ�Զ�����  
set guioptions-=m          " ���ز˵��� 
set guioptions-=T          " ���ع����� 
set guioptions-=L          " ������������ 
set guioptions-=r          " �����Ҳ������ 
"set guioptions-=b        " ���صײ������� 
"set showtabline=0        " ����Tab��
set autoindent             " �Զ�����
set cindent                " C�Զ�����
set shiftwidth=4           " �Զ������հ��ַ�����
set softtabstop=4          " tab����һ���Ʊ�������softtabstop=5,tabstop=4,��tab��1���Ʊ����1���ո�Ļ��
set tabstop=4              " tab���Ŀո���
set expandtab              " ʹ�ÿո����tab ��дMakefileʱ��Ҫ��tab
set backspace=2            " �����˸������
set nu!                   " ������ʾ�к�
set relativenumber        " ����к�"
"set wrap                 " �����Զ�����
set nowrap                 " ���ò��Զ�����
set noundofile
set noswapfile             " 
set nobackup               " �����ɱ����ļ�
"set backupdir=d:\Vim\tmp " ���ɱ����ļ���ָ���ط�
set hidden                 " ������δ�����޸�ʱ�л�������
set showcmd                " ��ʾ����
set nocompatible           " �ر���Vi����
"set display=lastline
set helplang=cn            " ʹ�����İ����ĵ�
set encoding=utf-8         " �鿴utf-8��ʽ�İ����ĵ�
set fileencodings=utf-8,gbk,utf8    "֧�ִ�gbk��ʽ���ļ�
syntax enable              " �﷨���� 
syntax on                  " �����ļ��������
set ignorecase smartcase   "��������ȫСд���ִ�Сд ����1��1���������ִ�Сд 
colorscheme peaksea         "���ô�����ɫ
set gfn=IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
"set gfw=��Բ:h10.5:cGB2312:qDRAFT "������Ч

"�����������----��
"set cursorcolumn
"hi CursorColumn cterm=NONE ctermbg=#000000 ctermfg=white guibg=darkred guifg=white

"�����������----��
set cursorline
"hi CursorLine  guibg=black

"�н���
set colorcolumn=85         " �ڵ�85���ַ���λ����ʾ��һ��������
hi colorcolumn guibg=DarkRed

"------------------------------------------------
"�۵� za zM(zi)
"""""""""""""""""""""""""""""""""""""""""""""""""
"set fdm=marker            " ����۵�����
"set fdm=indent            " �����۵�����
set fdm=syntax            " �﷨�۵�����
set foldenable            " ��ʼ�۵�
set foldlevelstart=99     " ���ļ���Ĭ�ϲ��۵�����
setlocal foldlevel=1      " �����۵�����Ϊ


"------------------------------------------------
"������󻯴���
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
"�����������
"""""""""""""""""""""""""""""""""""""""""""""""""
set fileencodings=utf-8,chinese,latin-1
if g:iswindows
    set fileencoding=chinese
    "set fileencoding=utf-8
else
    set fileencoding=utf-8
endif
"����˵�����
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"���consle�������
language messages zh_CN.utf-8


"------------------------------------------------
"cscope.exe
"""""""""""""""""""""""""""""""""""""""""""""""""
"�Զ�����cscope.out������
function! Do_CsTag()
    if g:iswindows
        " ʹ��ȫ�ֱ�ǵ�ǰλ�õ�Z (ȡ�ɵ�:ʹ��ȫ�ֱ��)
        execute "ma Z"
        " ��ת���1��.vim�ļ� *.vim���뱣֤���1�ļ� (ȡ�ɵ�:1b)
        execute "1b"
        " �Ͽ�cscope.out����    
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
    "����ctags
    "silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q" "win7���� win10ʹ�û���ת��h�ļ���

    "��Щ�������� ???
    silent! execute "!ctags -R *"

    " ��תȫ�ֱ��λ��Z
    execute "'Z"
endfunction

map <C-F12> <ESC>:call Do_CsTag()<cr>

nmap <unique> ,fs :cs find s <C-R>=expand("<cword>")<CR><CR>"���Һ��������ꡢö��ֵ�ȳ��ֵĵط�
nmap <unique> ,fg :cs find g <C-R>=expand("<cword>")<CR><CR>"���Һ������ꡢö�ٵȶ����λ��
nmap <unique> ,fc :cs find c <C-R>=expand("<cword>")<CR><CR>"���ұ��������õĺ���
nmap <unique> ,ft :cs find t <C-R>=expand("<cword>")<CR><CR>"���ҵ��ñ������ĺ���
nmap <unique> ,fe :cs find e 
nmap <unique> ,ff :cs find f 
nmap <unique> ,fi :cs find i <C-R>=expand("<cfile>")<CR>$<CR>"���Ҳ����ļ�
nmap <unique> ,fd :cs find d <C-R>=expand("<cword>")<CR><CR>"���Ұ������ļ����ļ�

"�趨ʹ��quickfix��������ʾcscope�Ľ��
set cscopequickfix=s-,c-,d-,i-,t-,e-    

"------------------------------------------------
"ӳ��QuickFix�Ŀ�ݼ�
"""""""""""""""""""""""""""""""""""""""""""""""""
"F6 ����QuickFix����
nmap <F6> :call QFixToggle(1)<CR>
nmap <F7> :cp<cr>"��һ��
nmap <F8> :cn<cr>"ǰһ��

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
"����python������
"""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"  
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m  
autocmd BufRead *.py nmap <F3> :!python %<CR>  
"autocmd BufRead *.py nmap <F3> :!python main.py<CR>  
"autocmd BufRead *.py nmap <F4> :make<CR>  
"autocmd BufRead *.py copen "�����py�ļ�����ͬʱ�򿪱�����Ϣ���� 

set filetype=python
au BufNewFile,BufRead *.py,*.pyw setf python

"------------------------------------------------
"��matchit.vim��� verilog���ԳɶԱ�ǩ��ת
"""""""""""""""""""""""""""""""""""""""""""""""""
source $VIMRUNTIME/macros/matchit.vim

"---------------------------
" �ҵĿ�ݲ���
""""""""""""""""""""""""""""
"ʹ�� tab �滻 %
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

"���ڴ��ڴ�С
nmap <C-h> :vertical res+1<cr>
nmap <C-l> :vertical res-1<cr>

"------------------------------------------------
"    nmap
"""""""""""""""""""""""""""""""""""""""""""""""""
" Esc �����������
nnoremap <esc> :noh<return><esc>

"���ڲ����Ŀ�ݼ�
    "��ֱ�ָǰ����
nmap wv        <C-w>v
    "ˮƽ�ָǰ����
nmap ws        <C-w>s
    "�رյ�ǰ����
nmap wc        <C-w>c
nmap wh        <C-w>h
nmap wj        <C-w>j
nmap wk        <C-w>k
nmap wl        <C-w>l
nmap wo        <C-w>o

"------------------------------------------------
" ab ����ģʽ
"""""""""""""""""""""""""""""""""""""""""""""""""

"------------------------------------------------
" iab �༭ģʽ
"""""""""""""""""""""""""""""""""""""""""""""""""
iabbrev #d #define
iabbrev #i #ifdef
iabbrev vo volatile
iabbrev con  continue

"����ģʽ ��ȡ����ʱ�� xtime
iab xtime <c-r>=strftime("%Y-%m-%d %H:%M:%S")

"------------------------------------------------
" cab ����ģʽ
"""""""""""""""""""""""""""""""""""""""""""""""""
cab path/\ s/\//\\/g
cab path\/ s/\\/\//g

"------------------------------------------------
" ��Ŀ�����ļ� ���� 
"""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable("Prj.vim")
    source Prj.vim
endif 

