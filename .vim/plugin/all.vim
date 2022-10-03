"" Plugins

" if executable('rg')
"   " Use ripgrep over grep
"   set grepprg=rg\ --vimgrep
" endif

" if has('nvim')
"   " Fzf
"   let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
"   command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

"   map <Leader>p :Files<CR>
"   map <c-p> :Files<CR>
" else
"   " " CntrlP
"   map <Leader>p :CtrlP<CR>
"   map <c-p> :CtrlP<CR>
"   " vvv this is not working :'(
"   map <C-A-S-D-p> :CtrlP<CR>
"   let g:ctrlp_custom_ignore = 'tmp$\|public/assets$\|tags$\|\.ds_store$\|\.swp$\|.png\|node_modules\|bower_components\|dist'
"   " let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
"   let g:ctrlp_user_command = 'rg --files  %s'
"   let g:ctrlp_show_hidden = 1
"   let g:ctrlp_working_path_mode = 'rw'
"   nnoremap <leader>f :CtrlPTag<cr>
" endif

" " vim-grepper
" nnoremap <leader>g :Grepper -tool rg<cr>
" nnoremap <c-g> :Grepper -tool rg<cr>

" " QFEnter
let g:qfenter_keymap = {}
let g:qfenter_keymap.open = ['o']
let g:qfenter_keymap.vopen = ['v']
let g:qfenter_keymap.hopen = ['h']
let g:qfenter_keymap.topen = ['t']

" " tabular-vim
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize/\(:.*\)\@<!:\zs /l0<CR>
vmap <Leader>a: :Tabularize/\(:.*\)\@<!:\zs /l0<CR>
nmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a=> :Tabularize /=><CR>

" " vim-dirvish
" augroup dirvish_config
"   autocmd!
"   autocmd FileType dirvish silent! unmap <buffer> <C-p>
" augroup END

" let g:dirvish_mode = ':sort ,^.*[\/],'

" " neoterm
command NewVerticalTerminal :vert Tnew
" nmap <silent> <Leader>r :T all<CR>

nnoremap <leader>t :NewVerticalTerminal <CR> <C-W><C-L>
inoremap <leader>t <Esc>:NewVerticalTerminal <CR> <C-W><C-L>

" " plasticboy/vim-markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_fenced_languages = ['bash=sh', 'ruby=rb', 'javascript=js']

" " vimwiki/vimwiki
" let g:vimwiki_list = [{'path': '~/Dropbox/Notes/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
" map <Leader>c <Plug>VimwikiToggleListItem

