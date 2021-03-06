set nocompatible
filetype off

set expandtab
set softtabstop=2
set shiftwidth=2
set tabstop=2
set tw=102

set backupdir=~/.vim/temp
set directory=~/.vim/temp

let mapleader=","

colorscheme koehler
set ai
set ruler
set showcmd
set hlsearch

filetype plugin indent on
syntax on
au BufRead,BufNewFile {Capfile,Gemfile,Vagrantfile,Rakefile,Thorfile,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby
au BufRead,BufNewFile {*.jbuilder,*.rabl,*.rubyxl,*.etl} setf ruby
au BufRead,BufNewFile *.go set filetype=go
au BufNewFile,BufRead *.jst set syntax=jst
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.port set filetype=python

set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set number
    set norelativenumber
  else
    if(&number == 1)
      set nonumber
      set norelativenumber
    else
      set nonumber
      set relativenumber
    endif
  endif
endfunc

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>

map <F1> :r! reattach-to-user-namespace pbpaste
nnoremap <F2> :call NumberToggle()<cr>
nmap <F4>  :vsplit<bar>wincmd l<bar>exe "norm! Ljz<c-v><cr>"<cr>:set scb<cr>:wincmd h<cr>:set scb<cr>
map <F7> :set spell!
map <F9> :noh

map <down> <nop>
map <left> <nop>
map <right> <nop>
map <up> <nop>   

imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
imap <up> <nop> 

nnoremap <Space> :
nmap <silent> <C-N> :silent noh<CR>

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%:t"))
autocmd VimLeave * call system("tmux rename-window bash")
autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.coffee,*.scss,*.js,*.css,*.erb,*.yml :call <SID>StripTrailingWhitespaces()
autocmd Filetype python setl expandtab tabstop=2 shiftwidth=2

