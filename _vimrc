
set nocompatible   "�ر���Vi����
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
" ��������
""""""""""""""""""""""""""""

"----------------
"    leader     "
"""""""""""""""""
" ���� leader ��������Ϊ�պż� ; ��
let mapleader="," 

" general copy/paste.
" NOTE: y,p,P could be mapped by other key-mapping
map <unique> <leader>y "*y
map <unique> <leader>p "*p
map <unique> <leader>P "*P
map <unique> <leader>v <C-q> 
map <unique> <leader>wa :wall<cr>
map <unique> <leader>wf :w<cr>


" ��ͨģʽ��;ӳ���:
nnoremap ; :

set helplang=cn            "ʹ�����İ����ĵ�
set encoding=utf-8        "�鿴utf-8��ʽ�İ����ĵ�
set fileencodings=utf-8,gbk,utf8    "֧�ִ�gbk��ʽ���ļ�
syntax enable    " �﷨���� 
syntax on        " �����ļ��������

colorscheme desert  "���ô�����ɫ darkblue  
set cursorline "ͻ����ǰ��

"set guifont=Bitstream\ Vera\ Sans\ Mono\ 12    "��������ΪBitstream Vera Sans Mono 12��С
set guifont=Courier_New:h10:cANSI

set autoindent             "�Զ�����
set cindent                "C�Զ�����
set shiftwidth=4           "�Զ������հ��ַ�����
set softtabstop=4          "tab����һ���Ʊ�������softtabstop=5,tabstop=4,��tab��1���Ʊ����1���ո�Ļ��
set tabstop=4              "tab���Ŀո���
set expandtab              "ʹ�ÿո����tab ��дMakefileʱ��Ҫ��tab
set backspace=2            "�����˸������

set nu!                    "������ʾ�к�
"set wrap                  "�����Զ�����
set nowrap                 "���ò��Զ�����
set noswapfile             " 
set nobackup               " �����ɱ����ļ�
"set backupdir=d:\Vim\tmp  " ���ɱ����ļ���ָ���ط�
set hidden                 " ������δ�����޸�ʱ�л�������
set showcmd                " ��ʾ����

"ʹ�� tab �滻 %
nnoremap <tab> %
vnoremap <tab> %

"��������ȫСд���ִ�Сд ����1��1���������ִ�Сд 
set ignorecase
set smartcase

"���ݴ��ڴ�С�Զ�����
"set wrap
"set textwidth=79
"set formatoptions=qrn1

"�ڵ�85���ַ���λ����ʾ��һ��������
set colorcolumn=85

"�۵�
set fdm=marker              " ����۵�����
"set fdm=indent              " �����۵�����
set fdm=syntax              " ����ʱ�����۵�����
"set foldenable              " ��ʼ�۵�
"set foldlevelstart=99       " ���ļ���Ĭ�ϲ��۵�����
"setlocal foldlevel=1        " �����۵�����Ϊ


"������󻯴���
function! MaximizeWindow()    
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction

"set guioptions-=m " ���ز˵��� 
set guioptions-=T " ���ع����� 
"set guioptions-=L " ������������ 
"set guioptions-=r " �����Ҳ������ 
"set guioptions-=b " ���صײ������� 
"set showtabline=0 " ����Tab��

if has('win32')    
    au GUIEnter * simalt ~x
else    
    au GUIEnter * call MaximizeWindow()
endif 



"autocmd FileType python set omnifunc=python3complete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType c set omnifunc=ccomplete#Complete
""""""""""""""""""""""""""""
"�����������
""""""""""""""""""""""""""""
set fileencodings=utf-8,chinese,latin-1
if has("win32")
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif
"����˵�����
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"���consle�������
language messages zh_CN.utf-8

""""""""""""""""""""""""""""
"A    ͷ/Դ�ļ��л�
""""""""""""""""""""""""""""
    ":A :AS :AV ͷ/Դ�ļ��л�,���ڷ�Ϊ�����������ڣ�����.h/.c�ļ�
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
"����taglist
let Tlist_Show_One_File=1 
let Tlist_Exit_OnlyWindow=1
"����FileExplorer
let g:winManagerWindowLayout='FileExplorer|TagList'  "��winmanager���ó��������TagList�����
"let g:winManagerWindowLayout='TagList'  "��winmanager���ó��������TagList�����
    "ӳ��winmanager�Ŀ�ݼ�
nmap wm :WMToggle<cr>
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

nmap wn :vertical res 50<cr>
nmap wb :vertical res 100<cr> 

""""""""""""""""""""""""""""
"���ĵ�������ǩ���༭
""""""""""""""""""""""""""""
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapWindowsNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplorerMoreThanOne=1



""""""""""""""""""""""""""""
"cscope
"""""""""""""""""""""""""""""
"�Զ�����cscope.out������
function! Do_CsTag()
    if(has('win32'))
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
    silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q"
    ":'0  "ʹ����ǩ��ת���ϴ��˳�ʱ�ĵط�
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
"����ctags
"silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q"
endfunction

"ӳ��cscope�Ŀ�ݼ�
"nmap <F5>s :cs find s <C-R>=expand("<cword>")<CR><CR>  "���Һ��������ꡢö��ֵ�ȳ��ֵĵط�
"nmap <F5>g :cs find g <C-R>=expand("<cword>")<CR><CR>  "���Һ������ꡢö�ٵȶ����λ��
"nmap <F5>c :cs find c <C-R>=expand("<cword>")<CR><CR>  "���ұ��������õĺ���
"nmap <F5>t :cs find t <C-R>=expand("<cword>")<CR><CR>  "���ҵ��ñ������ĺ���
"nmap <F5>e :cs find e <C-R>=expand("<cword>")<CR><CR>  "����ָ�����ַ���
"nmap <F5>f :cs find f <C-R>=expand("<cfile>")<CR><CR>  "����egrepģʽ
"nmap <F5>i :cs find i <C-R>=expand("<cfile>")<CR>$<CR> "���Ҳ����ļ�
"nmap <F5>d :cs find d <C-R>=expand("<cword>")<CR><CR>  "���Ұ������ļ����ļ�

nmap <unique> <leader>fs :cs find s <C-R>=expand("<cword>")<CR><CR>  "���Һ��������ꡢö��ֵ�ȳ��ֵĵط�
nmap <unique> <leader>fg :cs find g <C-R>=expand("<cword>")<CR><CR>  "���Һ������ꡢö�ٵȶ����λ��
nmap <unique> <leader>fc :cs find c <C-R>=expand("<cword>")<CR><CR>  "���ұ��������õĺ���
nmap <unique> <leader>ft :cs find t <C-R>=expand("<cword>")<CR><CR>  "���ҵ��ñ������ĺ���
nmap <unique> <leader>fe :cs find e 
nmap <unique> <leader>ff :cs find f 
nmap <unique> <leader>fi :cs find i <C-R>=expand("<cfile>")<CR>$<CR> "���Ҳ����ļ�
nmap <unique> <leader>fd :cs find d <C-R>=expand("<cword>")<CR><CR>  "���Ұ������ļ����ļ�

"�趨ʹ��quickfix��������ʾcscope�Ľ��
set cscopequickfix=s-,c-,d-,i-,t-,e-    

""""""""""""""""""""""""""""
"ӳ��QuickFix�Ŀ�ݼ�
"""""""""""""""""""""""""""""
nmap <F8>   :cn<cr>        "ǰһ��
nmap <F7>   :cp<cr>        "��һ��

"nmap <leader>co :QFix<CR>
"F6 ����QuickFix����
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
let g:LookupFile_MinPatLength           = 2 "��������2���ַ���ʼƥ��
let g:LookupFile_PreserveLastPattern    = 0 "�������ϴβ��ҵ��ַ���
let g:LookupFile_PreservePatternHistory = 1 "���������ʷ
let g:LookupFile_AlwaysAcceptFirst      = 1 "�س��򿪵�һ��ƥ����Ŀ
let g:LookupFile_AllowNewFiles          = 0 "�������������ڵ��ļ�

"�����ļ��������������ַ������ļ�
nmap <silent> <leader>lf :LUTags<cr>
"�����Ѵ򿪵�buffer�ַ���
nmap <silent> <leader>ll :LUBufs<cr>
"ָ��Ŀ¼�ṹ����
nmap <silent> <leader>lw :LUWalk<cr>

" close lookupfile window by two <Esc>
"nnoremap <Esc><Esc> <C-W>q
"inoremap <Esc><Esc> <Esc><C-W>q 

""""""""""""""""""""""""""""
"����python������
"""""""""""""""""""""""""""""
autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"  
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m  
autocmd BufRead *.py nmap <F3> :!python %<CR>  
"autocmd BufRead *.py nmap <F3> :!python main.py<CR>  
autocmd BufRead *.py nmap <F4> :make<CR>  
"autocmd BufRead *.py copen "�����py�ļ�����ͬʱ�򿪱�����Ϣ���� 

set filetype=python
au BufNewFile,BufRead *.py,*.pyw setf python

"---------------------------
" �ҵĿ�ݲ���
""""""""""""""""""""""""""""

"----------------
"    nmap       "
"""""""""""""""""
" Esc �����������
nnoremap <esc> :noh<return><esc>


"----------------
"    imap       "
"""""""""""""""""
" ����ģʽ����Norm
imap kk <ESC>


""""""""""""""""""""""""""""
"�Զ���ȫ ( { [ " '
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
"��д  ab���� iab���� cab���� #d<Space>
"""""""""""""""""""""""""""""
iabbrev #d #define 
iabbrev #i #ifdef
iabbrev vo volatile
iabbrev con  continue

""""""""""""""""""""""""""""
"��matchit.vim��� verilog���ԳɶԱ�ǩ��ת
"""""""""""""""""""""""""""""
source $VIMRUNTIME/macros/matchit.vim

