vim.cmd [[
    augroup _general
	au!
	autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
	autocmd FileType help nnoremap <silent> <buffer> "<C-W>T"
	autocmd FileType qf set nobuflisted
	autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
	autocmd BufWinEnter * set formatoptions-=cro
    augroup end
]]

-- -- Netrw
-- vim.cmd [[
--     augroup netrw_mapping
--         autocmd!
--         autocmd filetype netrw call NetrwMapping()
--     augroup END
--
--     function! NetrwMapping()
--         nmap <buffer> <right> <CR>
--         nmap <buffer> <left> -<esc>
--         nmap <buffer> "gh" "*@:<C-U>call <SNR>61_NetrwHidden(1)<CR>"
--         nmap <buffer> "." ": %<left><left>"
--     endfunction
-- ]]

-- Spellchecking and autowrapping lines
vim.cmd [[
    augroup _git
	au!
	autocmd FileType markdown setlocal nowrap
	autocmd FileType gitcommit setlocal wrap
	autocmd FileType markdown setlocal conceallevel=1
	autocmd FileType gitcommit,markdown setlocal spell spelllang=en,el
    augroup end
]]

-- Filetype dependent tabs and line-lengths
vim.cmd [[
    augroup _ft_tabs
	au!
        autocmd FileType nix,html,ruby,javascript,css,markdown,json setlocal et sw=2 ts=4
        autocmd FileType python setlocal et sw=4 ts=8
        autocmd FileType html,javascript,json setlocal colorcolumn=120
    augroup end
]]

-- Auto resize splits as window is resized
vim.cmd [[
    augroup _au_resize
	au!
	autocmd VimResized * tabdo wincmd = 
    augroup end
]]

-- Alpha
vim.cmd [[
    augroup _alpha
	au!
	au FileType alpha set showtabline=0 laststatus=0 noruler | au BufUnload <buffer> set showtabline=2 laststatus=2 ruler
    augroup end
]]

-- Perfect Wrapping
-- vim.cmd [[
--         " Allow enabling by running the command ":Freeform", or <leader>sw
--     command! Softwrap :call SetupSoftwrap()
--     map <Leader>sw :call SetupSoftwrap() <CR>
--
--     func! SetupFreeform()
--     " Use setlocal for all of these so they don't affect other buffers
--
--     " Enable line wrapping.
--     setlocal wrap
--     " Only break at words.
--     setlocal linebreak
--     " Turn on spellchecking
--     setlocal spell
--
--     " Make jk and 0$ work on visual lines.
--     nnoremap <buffer> j gj
--     nnoremap <buffer> k gk
--     nnoremap <buffer> 0 g0
--     nnoremap <buffer> $ g$
--
--     " Disable colorcolumn, in case you use it as a column-width indicator
--     " I use: let &colorcolumn = join(range(101, 300), ",")
--     " so this overrides that.
--     setlocal colorcolumn=
--
--     " cursorline and cursorcolumn don't work as well in wrap mode, so
--     " you may want to disable them. cursorline highlights the whole line,
--     " so if you write a whole paragraph on a single line, the whole
--     " paragraph will be highlighted. cursorcolumn only highlights the actual
--     " column number, not the visual line, so the highlighting will be broken
--     " up on wrapped lines.
--     setlocal nocursorline
--     setlocal nocursorcolumn
--     endfunc
-- ]]
-- Soft wrap at 80
-- vim.cmd [[
--     command! -nargs=? Draft :call SetupDraftMode(<args>)
--     func! SetupDraftMode()
--     " I like 80 columns + 4 for line numbers
--     set columns=84
--     autocmd VimResized * if (&columns > 84) | set columns=84 | endif
--
--     :Softwrap
--     endfunc
-- ]]

vim.cmd [[
    command! Term :call Tmux()

    function Tmux()
        silent! let l:status = system('which tmux')
        let $pwd=getcwd()
        lcd %:p:h
        if l:status !~ '\w\+'
            :botright vsplit term://$SHELL
        else
            !tmux -C split-window -h &
        endif
        lcd $pwd
    endfunction
    " Autoformat
    "augroup _au_format
    "    autocmd!
    "    autocmd BufWritePre * lua vim.lsp.buf.formatting()
    "augroup end
    augroup _term
        autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
        autocmd TermOpen * startinsert
        autocmd BufLeave term://* stopinsert
    augroup end
]]
local map = require("lib.key").map
map("n", "<LEADER>T", "<CMD>Term<CR>", "Open terminal vSplit")
