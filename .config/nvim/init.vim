"" file config
set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden

"" view config
set showcmd
" line number
set number
" emphasize cursor line
set cursorline
set virtualedit=onemore
set smartindent
set visualbell
" highlight corresponding brace
set showmatch
" always show status line
set laststatus=2
set wildmode=list:longest
set scrolloff=5

"" tab config
" visualize tab character
set list listchars=tab:\▸\-
" input tab to space
set expandtab
set tabstop=2
set shiftwidth=2

"" search config
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch

"" alias
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

nnoremap <ESC><ESC> :nohl<CR>

" insert blank line
nnoremap <CR> i<CR><Esc>

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//ge

" filetype definition
autocmd BufRead,BufNewFile *.slim setfiletype slim
autocmd BufRead,BufNewFile *.coffee setfiletype coffee

"" color config
let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid
set background=dark
" set line color
hi LineNr ctermbg=0 ctermfg=0
hi CursorLineNr ctermbg=4 ctermfg=0
hi clear CursorLine

if &compatible
  set nocompatible
endif

"" plugin config
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand('~/.config/nvim')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
