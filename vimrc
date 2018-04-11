set nocompatible
filetype plugin on
syntax on
set number
set complete+=s
set formatprg=par
set background=dark
set tabstop=4
set columns=80
set wrap
set linebreak

" vimwiki 
let wiki_1 = {}
let wiki_1.path = '~/vimwiki/matthewgraybosch/'
let wiki_1.path_html = '~/public_html/matthewgraybosch/'

let wiki_2 = {}
let wiki_2.path = '~/vimwiki/starbreaker/'
let wiki_2.path_html = '~/public_html/starbreaker/'

let g:vimwiki_list = [wiki_1, wiki_2]

" The following are for the vim-pencil plugin
augroup pencil
	autocmd!
	autocmd FileType markdown,mkd,md,rst 	call pencil#init({'wrap': 'hard', 'autoformat': 1})
   	autocmd FileType text         		call pencil#init({'wrap': 'hard', 'autoformat': 1})
    autocmd FileType wiki         		call pencil#init({'wrap': 'soft'})
	autocmd FileType fountain			call pencil#init({'wrap': 'soft'})
augroup END
set guifont=Source\ Code\ Pro\ for\ Powerline\ 12
" The following are settings we need for the pencil colorscheme
let g:pencil_higher_contrast_ui = 1
let g:pencil_terminal_italics = 1
" airline settings
let g:airline_powerline_fonts = 1
let g:airline_theme = 'pencil'
" lightline settings
let g:lightline = {
      \ 'colorscheme': 'PaperColor_dark'
      \ }
" Now we can set the color scheme
colorscheme pencil

" Git autocommit function by darookee@reddit.com
" https://www.reddit.com/r/vim/comments/3r7w8b/is_it_possible_to_have_vim_tell_git_to_do_a/cwm30g0/
function AutoGitCommit()
  call system('git rev-parse --git-dir > /dev/null 2>&1')
  if v:shell_error
    return
  endif
  let message = input('Message? ', 'Auto-commit: saved ' . expand('%'))
  call system('git add ' . expand('%:p'))
  call system('git commit -m ' . shellescape(message, 1))
endfun

" Git autocommit locations
autocmd BufWritePost ~/documents/pelican.matthewgraybosch.com/* call AutoGitCommit()
autocmd BufWritePost ~/documents/starbreaker/* call AutoGitCommit()

" I use the following packages in ~/.vim/pack/demifiend to extend
" vim since Vim 8.x finally got package functionality. I must still
" download the packages manually, though. No big deal, but let's list
" them here. 
"
" tpope/vim-sensible 
" tpope/vim-markdown 
" tpope/vim-fugitive
" kblin/vim-fountain
" reedes/vim-pencil
" reedes/vim-colors-pencil
" bling/itchyny-lightline
" vimwiki/vimwiki
" mattn/calendar-vim
