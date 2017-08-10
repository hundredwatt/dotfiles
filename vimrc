set expandtab
set softtabstop=2
set shiftwidth=2
set tabstop=2
set tw=102

set backupdir=~/.vim/temp
set directory=~/.vim/temp

let mapleader=","

au BufRead,BufNewFile {Capfile,Gemfile,Vagrantfile,Rakefile,Thorfile,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby
au BufRead,BufNewFile {*.jbuilder,*.rabl,*.rubyxl} setf ruby

syntax on
filetype plugin indent on

set ai

colorscheme koehler
set ruler

nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>

map <F1> :r! reattach-to-user-namespace pbpaste
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

let vimclojure#ParenRainbow  = 1

nmap <F4>  :vsplit<bar>wincmd l<bar>exe "norm! Ljz<c-v><cr>"<cr>:set scb<cr>:wincmd h<cr>:set scb<cr>

set showcmd

set hlsearch

nmap <silent> <C-N> :silent noh<CR>

au BufRead,BufNewFile *.go set filetype=go

au  BufNewFile,BufRead *.jst set syntax=jst
au BufRead,BufNewFile *.md set filetype=markdown

call pathogen#infect()

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

nnoremap <F2> :call NumberToggle()<cr>

autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%:t"))
autocmd VimLeave * call system("tmux rename-window bash")

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,clojure autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.coffee,*.scss,*.js,*.css,*.erb,*.yml :call <SID>StripTrailingWhitespaces()

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'thoughtbot/vim-rspec'
" Rspec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

Bundle 'kien/ctrlp.vim'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle 'jgdavey/tslime.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'keith/swift.vim'

let g:rspec_command = 'call Send_to_Tmux("./bin/rspec {spec}\n")'

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
