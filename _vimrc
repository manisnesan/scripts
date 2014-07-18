" Pathogen - vim package manager
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"Map leader to ,
let mapleader=","

" Commant -T -> pattern based file opener
"
"
" CommandT - opens filelist in current directory
nnoremap <leader>o <Esc>:CommandT<CR>

" CommandTBuffer - opens currently open buffers
nnoremap <leader>O <Esc>:CommandTFlush<CR>

" CommandTFlush - re-read file list in current directory
nnoremap <leader>m <Esc>:CommandTBuffer<CR>
"
"
" General stuff
"
" set nocompatible
" filetype on
"
" set background=light
"
" SYNTAX HIGLIGHTING
 syntax on
"
" set ruler
" set noerrorbells
" set nostartofline
"
" LINE NUMBERING
 set number 
"
 set laststatus=2
" " Text Formatting
"
" " don't make it look like there are line breaks where there aren't:
" set nowrap
"
" " use indents of 2 spaces, and have them copied down lines:
 set tabstop=4
 set shiftwidth=4
" set softtabstop=5
" set shiftround
" set noexpandtab
" set noautoindent
" set nosi
"
" " search and replace stuff
 set ignorecase
 set smartcase
"
 set encoding=utf-8
 set fileencoding=utf-8
"
" set tw=0
"
 set backupdir=/tmp/vimbackup
 set directory=/tmp/vimswap
"
" FILETYPE DETECTION
if has("autocmd")
	    filetype on
		filetype indent on
		filetype plugin on
endif
 autocmd FileType python set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
 autocmd FileType c set tabstop=3 shiftwidth=3
 autocmd FileType cpp set tabstop=3 shiftwidth=3
 autocmd FileType sql set tabstop=3 shiftwidth=3 nowrap
 autocmd FileType xml set tabstop=4 shiftwidth=4 softtabstop=4 nowrap
 autocmd FileType html set nowrap
" autocmd BufRead,BufNewFile *.txt set tabstop=5 shiftwidth=5 wrap
" autocmd BufRead,BufNewFile mutt* set wrap spell spelllang=en_us
" spellfile=~/.vim/spellfile.add
"
" highlight clear SpellBad
" highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
" highlight clear SpellCap
" highlight SpellCap term=underline cterm=underline
" highlight clear SpellRare
" highlight SpellRare term=underline cterm=underline
" highlight clear SpellLocal
" highlight SpellLocal term=underline cterm=underline
"
" au BufWritePre * set binary noeol
" au BufWritePost * set nobinary eol
" au BufEnter *.py,*.cpp,*.c,*.h exec 'match Todo /\%>80v.\+/'
" au BufEnter *.cls set syntax=apex tabstop=4 shiftwidth=4 softtabstop=4
" nowrap
" au BufEnter *.cls exec 'match Todo /\%>80v.\+/'
" au BufEnter *.trigger set syntax=apex tabstop=4 shiftwidth=4 softtabstop=4
" nowrap
" au BufEnter *.trigger exec 'match Todo /\%>80v.\+/'
" au BufEnter *.page set tabstop=4 shiftwidth=4 softtabstop=4 nowrap
"
" map  :$r /home/msivanes/.mutt/sig
call pathogen#infect() 
filetype plugin indent on
set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,options,resize,tabpages,winsize,winpos

"C++ Autocompletion
set nocp
filetype plugin on
"Ctrl-L will update the tags (and so let you autocomplete based on new files) files in the current directory.
map <C-L> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>

set tags=~/.vim/stdtags,tags,.tags,../tags

"Closes the completion box when you leave insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"Build Java files with ant automatically
autocmd BufRead *.java set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
autocmd BufRead set makeprg=ant\ -find\ build.xml

"Hidden buffers
set hidden

"Enabling the mouse support in vim
"set mouse=a

" Jeff's cscope settings
" Note : To setup cscope for your project
" $ find . -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" >  cscope.files
" $ cscope -q -R -b -i cscope.files
"
if has("cscope")
	set csprg=/usr/bin/cscope
	" change this to 1 to search ctags DBs first
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
	    cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
	    cs add $CSCOPE_DB
	endif
	set csverb

	" Using 'CTRL-\' then a search type makes the vim window
	" "shell-out", with search results displayed on the bottom

	nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

	" Using 'CTRL-spacebar' then a search type makes the vim window
	" split horizontally, with search result displayed in
	" the new window.

	nmap <C-[>s :scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-[>g :scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-[>c :scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-[>t :scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-[>e :scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-[>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-[>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-[>d :scs find d <C-R>=expand("<cword>")<CR><CR>

	" Hitting CTRL-space *twice* before the search type does a vertical
	" split instead of a horizontal one

	nmap <C-[><C-[>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-[><C-[>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-[><C-[>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-[><C-[>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-[><C-[>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-[><C-[>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-[><C-[>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
endif

" Toggle to distraction free VimRoom
nnoremap <silent> <Leader>mz <Plug>VimroomToggle

" Taglist window will be opened automatically
let Tlist_Auto_Open = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window   = 1

" Open a NERDTree automatically at startup
autocmd vimenter * NERDTree

" To make a buffer modifiable
:set modifiable
