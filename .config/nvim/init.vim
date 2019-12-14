" vim: fdm=marker fmr={{{,}}} fdl=0
set nocompatible

if !exists("g:gui_oni")
  " Required:
  set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
  
  " Required:
  if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')
  
    " Let dein manage dein
    " Required:
    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  
    call dein#load_toml($HOME . '/.config/nvim/plugs.toml', {"lazy": 0})
    call dein#load_toml($HOME . '/.config/nvim/plugs_lazy.toml', {"lazy": 1})
    " Add or remove your plugins here:
    " required:
    call dein#end()
    call dein#save_state()
  endif
  
  " if you want to install not installed plugins on startup.
  if dein#check_install()
    call dein#install()
  endif
endif

" Init {{{
filetype plugin indent on
syntax enable
" }}}

" Functions {{{
source ~/.config/nvim/functions.vim
" }}}

" Editing {{{
set mouse=
set foldlevelstart=20
set hidden
" }}}

" Appearance {{{
" Basic {{{
set relativenumber
set termguicolors
set noshowmode
set number
set cursorline
set inccommand="split"
" }}}
" Theme {{{
let g:onedark_terminal_italics = 1
" let g:onedark_color_overrides = {
" \ "black": {"gui": "#1B1D21", "cterm": "0", "cterm16": "0" },
" \ "cursor_grey": {"gui": "#2C323C", "cterm": "233", "cterm16": "0" },
" \ "visual_grey": {"gui": "#2C323C", "cterm": "234", "cterm16": "0" },
" \ "menu_grey": {"gui": "#2C323C", "cterm": "234", "cterm16": "0" },
" \ "special_grey": {"gui": "#2C323C", "cterm": "235", "cterm16": "0" },
" \ "gutter_fg_grey": {"gui": "#2C323C", "cterm": "235", "cterm16": "0" },
" \}
colorscheme onedark
" }}}
" Airline {{{
" let g:airline_theme='space'
let g:airline_theme='onedark'
" let g:airline_section_z = airline#section#create(['linenr'])
" let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['cocstatus', 'x', 'z', 'warning', 'error']]
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
let g:airline_section_cocstatus = "%{get(g:,'coc_status','')}"
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
let g:airline_exclude_preview = 1
let g:airline_powerline_fonts = 1
let g:airline_highlighting_cache = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" let g:airline_left_sep = '❮'
" let g:airline_right_sep = '❯'
let airline#extensions#coc#error_symbol = 'E:'
let airline#extensions#coc#warning_symbol = 'W:'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
" }}}
" Coc Sign Highlight {{{
hi! link CocErrorSign WarningMsg
hi! link CocWarningSign Number
hi! link CocInfoSign Type
" }}}
" }}}

" Completion {{{
" Basic {{{
set completeopt=noinsert,menuone,noselect
set updatetime=300
set shortmess+=c
" }}}
" Coc {{{
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nnoremap <silent> K :call <SID>show_documentation()<CR>
autocmd CursorHold * silent call CocActionAsync('highlight')
map <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
map <leader>a  <Plug>(coc-codeaction-selected)
map <leader>ac  <Plug>(coc-codeaction)
map <leader>qf  <Plug>(coc-fix-current)
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:coc_global_extensions = ["coc-python", "coc-json", "coc-vimtex", "coc-lists", "coc-prettier", "coc-yaml"]
" }}}
" }}}

" Files {{{
set autoread
nnoremap ZA :w suda://%<Return>:q<Return>
cmap e!! e suda://%
cmap r!! e suda://%
cmap w!! w suda://%
" }}}

" Clipboard {{{
set clipboard=unnamedplus
autocmd VimLeave * call system("xsel -ib", getreg('+'))
" }}}

" Format {{{
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab smarttab
set ignorecase
set list
set listchars=trail:·
" }}}

" KeyMappings {{{
" Leader Key {{{
nnoremap <Space> <Nop>
let mapleader = " "
let maplocalleader = ";"
" }}}
" Elegant Escape {{{
inoremap <S-CR> <Esc>`^
vnoremap <CR> <Esc>gV
onoremap <CR> <Esc>
" }}}
" Hide Search Highlights {{{
nnoremap <silent> <CR> :noh<CR><CR>
" }}}
" Elegant move in line {{{
nmap H ^
vmap H ^
nmap L $
vmap L $
" }}}
" Easier split navigations {{{
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" }}}
" Easier tab navigations {{{
nnoremap <silent>th :tabfirst<CR>
nnoremap <silent>tk :tabnext<CR>
nnoremap <silent>tj :tabprev<CR>
nnoremap <silent>tl :tablast<CR>
nnoremap <silent>tt :tabedit<Space>
nnoremap <silent>tm :tabm<Space>
nnoremap <silent>td :tabclose<CR>
nnoremap <silent>tn :tabnew<CR>
" }}}
" EasyMotion {{{
map /   <Plug>(easymotion-sn)
omap    /   <Plug>(easymotion-tn)
" map n   <Plug>(easymotion-next)
" map N   <Plug>(easymotion-prev)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>f <Plug>(easymotion-f)
map <Leader>F <Plug>(easymotion-F)
map <Leader>w <Plug>(easymotion-w)
map <Leader>b <Plug>(easymotion-b)
" }}}
" EdgeMotion {{{
map <C-j> <Plug>(edgemotion-j)
map <C-k> <Plug>(edgemotion-k)
" }}}
" Plugin Cleaning {{{
command DeinClean :call map(dein#check_clean(), "delete(v:val, 'rf')")
" }}}
" CtrlSpace {{{
nmap <silent> <Leader>p :CtrlSpace<CR>
" }}}
" Code Run {{{
autocmd filetype cpp nnoremap <Leader>r :w <bar> exec '!clang++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
" }}}
" }}}

" IME {{{
set ttimeoutlen=150
autocmd InsertLeave * call Fcitx2en()
" }}}

" Gnvim Configs {{{
let guifont = "Sarasa\ Mono\ SC:h10"

" Plugins {{{
" CtrlSf {{{
nmap <C-F> <Plug>CtrlSFPrompt
" }}}
" GnuPG {{{
let g:GPGDefaultRecipients=[ 
    \"5676005DB2E53AA977026A28EB9742286A02659C", 
    \] 
let g:GPGPossibleRecipients=[ 
    \"5676005DB2E53AA977026A28EB9742286A02659C", 
    \] 
" }}}
" Quick Scope {{{
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
autocmd WinEnter * if &previewwindow | let b:qs_local_disable=1 | endif
" }}}
" }}}
