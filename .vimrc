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
