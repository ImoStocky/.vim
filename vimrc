" Aktivatece nekompatibility mezi Vim a Vi
set nocompatible

" Zobrazovani cisel radku
set number

" Zakazani otravnych zvuku
set noerrorbells
set visualbell t_vb=

" Oznaceni presahujicich znaku za 80 radek
"if exists('+colorcolumn')
"  set colorcolumn=80
"else
"  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"endif

" OTESTOVAT
" Aktivace barevneho rezimu
"if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
"  set t_Co=256
"endif

" Oznaceni aktivniho radku a jeho barvy
set cursorline
hi CursorLine cterm=NONE ctermbg=236

" Zmena barvy cislovani radku
highlight LineNr ctermfg=238

" Zmena obarveni oznaceneho textu
hi Search cterm=NONE ctermfg=black ctermbg=221

" Zmena barev pro dialogové menu (Ctrl+P apod.)
highlight Pmenu ctermbg=238
highlight PmenuSel ctermbg=70

" Automaticke zarovnavani
set autoindent
set copyindent
filetype on
filetype indent on

" Expanze tabulatoru na mezery
set expandtab
set smarttab

" Velikost tabulatoru a mezer
set tabstop=4
set shiftwidth=3
set softtabstop=3

" Zobrazeni rozsireneho spodniho menu
set wildmenu
set wildmode=list:longest,full

" Pred/za kurzorem bude alespon tolik radku, aby nebyl u horni nebo dolni
" hranice editoru
set scrolloff=3

" Automaticke znovunacteni souboru, pokud byl zvenku modifikovan
set autoread

" Podpora mysi v editoru
"set mouse=a

" Zobrazeni bilych znaku na konci radku
"set list
set listchars=tab:>-,trail:.,extends:#,nbsp:.

" Historie zadanych prikazu
set history=100
" Historie poctu vraceni uprav zpet (UNDO)
set undolevels=100

" Nastaveni vyhledavani v textu
set incsearch   " vyhledani textu jiz pri jeho psani
set ignorecase  " vyhledani bez rozlisovani velikosti pismen
set smartcase   " aktivace case-sensitive v pripade ze dotaz ma velke pismeno



" Mapovani klaves pro prepinani zalozek
nnoremap <C-S-Right> :tabn<CR>
nnoremap <C-S-Left> :tabp<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-S-Down> :tabclose<CR>
nnoremap <C-S-Up> :tabnew<CR>
inoremap <C-S-Right> <Esc>:tabn<CR>
inoremap <C-S-Left> <Esc>:tabp<CR>
inoremap <C-t> <Esc>:tabnew<CR>
inoremap <C-S-Down> <Esc>:tabclose<CR>
inoremap <C-S-Up> <Esc>:tabnew<CR>

" Mapovani klaves pro presouvani radku
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

"------------------------------------------------------------------------------
" PHP
" autocmd FileType php setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
"

"------------------------------------------------------------------------------
" Enable plugins
execute pathogen#infect()
call pathogen#helptags()

" PLUGIN vim-airline
" Vzdy zobrazovat dolni listu
set laststatus=2
" Sablona
let g:airline_theme='raven'
"let g:airline_theme='murmur'
" Vzdy zobrazovat horni listu
let g:airline#extensions#tabline#enabled = 1

" PLUGIN NERDTree
" Pri otevreni Vimu bez prikazu otevrit NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Pri stisku Ctrl+n zobrazit/skryt NERDTree
nmap <C-n> :NERDTreeToggle<CR>

" PLUGIN Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

