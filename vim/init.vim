
" ##################################################################################
" Vim-plug Start
" ----------------------------------------------------------------------------------

call plug#begin('~/.local/share/nvim/plugged')

" GUI enhancements ###

Plug 'chriskempson/base16-vim'   " Base16 colorscheme for Vim.
Plug 'joshdick/onedark.vim'      " OneDark colorscheme for Vim.
Plug 'ap/vim-buftabline'         " A well-integrated, low-configuration buffer list that lives in the tabline.
Plug 'itchyny/vim-gitbranch'     " Provides the branch name of the current git repository.
Plug 'scrooloose/nerdcommenter'  " Comment functions
Plug 'itchyny/lightline.vim'     " A light and configurable statusline/tabline plugin for Vim.
Plug 'scrooloose/nerdtree'       " A tree explorer plugin for vim.
" Plug 'majutsushi/tagbar'         " Vim plugin that displays tags in a window, ordered by scope.


" Semantic language support
Plug 'w0rp/ale/'                " Language Server Protocol (LSP) integration in Vim.
Plug 'dag/vim-fish'
Plug 'valloric/YouCompleteMe'   " A code-completion engine for Vim
Plug 'vim-syntastic/syntastic'  " Syntax checking hacks for vim


" Rust Enhancement
Plug 'rust-lang/rust.vim'        " Official Rust vim configuration support.
Plug 'AndrewRadev/sideways.vim'  " A Vim plugin to move function arguments.
Plug 'AndrewRadev/splitjoin.vim' " A vim plugin that simplifies the transition between multiline and single-line code.
Plug 'cespare/vim-toml'          " Vim syntax for TOML.

" Gui Enhancement
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-path'         " Path Completion for Ncm2.
Plug 'ncm2/ncm2-bufword'
Plug 'godlygeek/tabular'      " Vim script for text filtering and alignment.
Plug 'jiangmiao/auto-pairs'   " Vim insert mode auto-completion for quotes, parens, brackets.

call plug#end()

" ----------------------------------------------------------------------------------
" Vim-plug End 
" ##################################################################################








" ##################################################################################
" Configurations Start
" ----------------------------------------------------------------------------------

" UI configuration

" let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme onedark  "github, base16-default-dark

set noshowmode  " Get rid of '-- INSERT --'

set number  " Show the line number

" Turn on Syntax highlight
syntax on
syntax enable

" Define <leader> mapping
let mapleader='\'

" Comment function need filetype plugin on
filetype plugin on

" Font
set guifont=Courier\ new:h20


" lightline configuration
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }


" ale Linter
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 0  " only lint on save
let g:ale_lint_on_enter = 0
let g:ale_virtualtext_cursor = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_sign_error = "✖"
let g:ale_sign_warning = "⚠"
let g:ale_sign_info = "i"
let g:ale_sign_hint = "➤"
let g:ale_rust_rls_toolchain = ''
let g:ale_linters = {
    \ 'python': ['flake8']
    \ }
" let g:ale_linters = {
"     \ 'rust': ['rls'],
"     \ 'python': ['flake8']
"     \ }
" let g:ale_rust_rls_config = {
" 	\ 'rust': {
" 		\ 'all_targets': 1,
" 		\ 'build_on_save': 0,
" 		\ 'clippy_preference': 'off'
" 	\ }
" 	\ }


" YouCompleteMe
let g:ycm_rust_src_path = $RUST_SRC_PATH



" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_loc_list_height = 5
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0



" NCM2
" augroup NCM2
"   autocmd!
"   " enable ncm2 for all buffers
"   autocmd BufEnter * call ncm2#enable_for_buffer()
"   " :help Ncm2PopupOpen for more information
"   set completeopt=noinsert,menuone,noselect
"   " tab to select
"   " and don't hijack my enter key
"   inoremap <expr><Tab> (pumvisible()?(empty(v:completed_item)?"\<C-n>":"\<C-y>"):"\<Tab>")
"   inoremap <expr><CR> (pumvisible()?(empty(v:completed_item)?"\<CR>\<CR>":"\<C-y>"):"\<CR>")
  
"   " uncomment this block if you use vimtex for LaTex
"   " autocmd Filetype tex call ncm2#register_source({
"   "           \ 'name': 'vimtex',
"   "           \ 'priority': 8,
"   "           \ 'scope': ['tex'],
"   "           \ 'mark': 'tex',
"   "           \ 'word_pattern': '\w+',
"   "           \ 'complete_pattern': g:vimtex#re#ncm2,
"   "           \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
"   "           \ })
" augroup END



" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
" let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


" 关闭NERDTree快捷键
"map <leader>t :NERDTreeToggle<CR>
" 显示行号
"let NERDTreeShowLineNumbers=1
"let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
"let NERDTreeWinSize=31
" 在终端启动vim时，共享NERDTree
"let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
"let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
"let NERDTreeShowBookmarks=1

" ----------------------------------------------------------------------------------
" Configurations End
" ##################################################################################








" ##################################################################################
" Behavior Start
" ----------------------------------------------------------------------------------

" Open NERDTree when open a document from vim.
autocmd vimenter * NERDTree
wincmd w
autocmd vimEnter * wincmd w

" Close all NERDTree after the last document was closed.
" autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif

" Support Copy text from vim to system clipboard(Ctrl + C on Visual mode)
vmap <C-c> :w !pbcopy<CR><CR>


" Show line number as relative number
set relativenumber
set nu
augroup relative_numbser
 autocmd!
 autocmd InsertEnter * :set norelativenumber
 autocmd InsertLeave * :set relativenumber
augroup END


" Turn off backup
set nobackup
set noswapfile
set nowritebackup


" Search configuration
set ignorecase    " ignore case when searching
set smartcase     " turn on smartcase


" ----------------------------------------------------------------------------------
" Behavior End
" ##################################################################################






" ##################################################################################
" Keyborad Mapping Start
" ----------------------------------------------------------------------------------

" Auto '}' completion
"set smartindent
"set tabstop=4
"set shiftwidth=4
"set expandtab
"imap{ {}<ESC>i<CR><ESC>O

" Keymap for AndrewRadev/sideways.vim
nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>

nnoremap <Leader>] :YcmCompleter GoTo<CR>


" Keymaps for Buftabline Plugin
set hidden
nnoremap <c-n> :bnext<CR>
nnoremap <c-p> :bprev<CR>

" Keymaps for Commment Commend
" nnoremap <D-<kDivide>> [count]<leader>c<space>

" ----------------------------------------------------------------------------------
" Keyborad Mapping End
" ##################################################################################








" ##################################################################################
" Necessary code for syntex highlight
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
" ##################################################################################

