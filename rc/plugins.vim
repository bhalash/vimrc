""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle Init
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
  " Colours for terminal vim.
  Plugin 'AlessandroYorba/Sidonia'

  " Colours for gvim/MacVim.
  Plugin 'mkarmona/colorsbox'

  " Black and white colourscheme.
  Plugin 'zaki/zazen'

  " Provide additional text targets for di/a<char>:
  " , . ; : + - = ~ _ * # / | \ & $
  Plugin 'wellle/targets.vim'

  " Provide motion keyed to gs<motion> to sort stuff.
  Plugin 'christoomey/vim-sort-motion'

  " Metric tracking.
  Plugin 'wakatime/vim-wakatime'

  " Better search highlighting.
  " Plugin 'timakro/vim-searchant'

  " Better FfTt action.
  Plugin 'unblevable/quick-scope'

  " Auto CD to project root.
  Plugin 'airblade/vim-rooter'

  " Vundle.
  Plugin 'VundleVim/Vundle.vim'

  " Quickly change wrapping characters with cs<char>.
  Plugin 'tpope/vim-surround'

  " Supertab.
  " Plugin 'ervandew/supertab'

  " Tabular
  Plugin 'godlygeek/tabular'

  " Case-insensitive replacement
  Plugin 'tpope/vim-abolish'

  " Completion
  Plugin 'Valloric/YouCompleteMe'

  " Authoring.
  Plugin 'junegunn/goyo.vim'
  Plugin 'reedes/vim-pencil'
  Plugin 'junegunn/limelight.vim'
  Plugin 'reedes/vim-wordy'

  " Quickly search for and open files in the current buffer, new split or tab.
  Plugin 'ctrlpvim/ctrlp.vim'

  " Ruby and Rails utilities. Tim Pope is God.
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-rails'
  Plugin 'tpope/vim-endwise'
  Plugin 'ngmy/vim-rubocop'

  " Toggle comments.
  Plugin 'tomtom/tcomment_vim'

  " Diff git files live.
  Plugin 'airblade/vim-gitgutter'

  " Airline
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'

  " Simplenote integration.
  Plugin 'mrtazz/simplenote.vim'

  " Syntax checking and linting.
  Plugin 'w0rp/ale'

  " Multi-language asynchronous REPL.
  Plugin 'metakirby5/codi.vim'

  " Syntax highlighting.
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'HerringtonDarkholme/yats.vim'
  Plugin 'cakebaker/scss-syntax.vim'
  Plugin 'clones/vim-zsh'
  Plugin 'elzr/vim-json'
  Plugin 'evanmiller/nginx-vim-syntax'
  Plugin 'jelera/vim-javascript-syntax'
  Plugin 'lambdatoast/elm.vim'
  Plugin 'leafgarland/typescript-vim'
  Plugin 'moll/vim-node'
  Plugin 'noprompt/vim-yardoc'
  Plugin 'plasticboy/vim-markdown'
  Plugin 'slim-template/vim-slim'
  Plugin 'mxw/vim-jsx'
  Plugin 'kchmck/vim-coffee-script'
call vundle#end()

filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Plugin Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Reduce timeout length on keystrokes. This is mostly for vim-statusline.
set ttimeout ttimeoutlen=50

" Disable markdown folding on load.
let g:vim_markdown_folding_disabled = 1

" Generate CTAGS upon file save.
let g:vim_tags_auto_generate = 1

" Silently auto CD to the root folder of the current git project.
let g:rooter_silent_chdir = 1

" Only highlight keys when the appropriate key is depressed.
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Goyo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:goyo_width = 170
let g:goyo_height = 90
let g:goyo_linenr = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists('g:ctrl_user_command')
  " Remove any blockers which prevent wildignore from not working.
  " May lead to a dramatic increase in CtrlP performance.
  unlet g:ctrlp_user_command
endif

" Bind CtrlP to <leader>
let g:ctrlp_map = '<leader>p'

" Permits us to change working directory in CtrlP while vim is open.
let g:ctrlp_working_path_mode = 0

" Ignore Rails temp and documentation files.
let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/](tmp|doc)$',
      \ 'file': '\v\.(cache)$'
      \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable Airline for buffers in the tablike.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#branch#format = 0

" Enable powerline fonts.
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-easytags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set tags+=~/.vim/tags
let g:easytags_file = '~/.vim/tags'
let g:easytags_dynamic_files = 2
let g:easytags_async = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ale
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_lint_on_enter	= 1

let g:ale_linters = {
      \   'javascript': ['eslint'],
      \   'ruby': ['rubocop'],
      \   'slim': ['slim-lint'],
      \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Supertab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:SuperTabContextDefaultCompletionType = '<c-p>'
" let g:SuperTabLongestHighlight = 1
" let g:SuperTabLongestEnhanced = 1
"
" " Supertab.
" let g:SuperTabDefaultCompletionType = 'context'
"
" let g:SuperTabCompletionContexts = [
"       \ 's:ContextText',
"       \ 's:ContextDiscover'
"       \ ]
"
" let g:SuperTabContextTextOmniPrecedence = [
"       \ '&completefunc',
"       \ '&omnifunc'
"       \ ]
"
" let g:SuperTabContextDiscoverDiscovery = [
"       \ '&completefunc:<c-x><c-u>',
"       \ '&omnifunc:<c-x><c-o>'
"       \ ]
"
" autocmd FileType *
"       \ if &omnifunc != '' |
"       \ call SuperTabChain(&omnifunc, '<c-p>') |
"       \ call SuperTabSetDefaultCompletionType('<c-x><c-u>') |
"       \ endif