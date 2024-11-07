vim.filetype.add({
    pattern = {
        ['.*/foot/.*.ini'] = 'confini',
        ['.*/mako/.*config'] = 'confini',
        ['.*/sway/.*conf'] = 'swayconfig',
        ['.*/hypr/.*conf'] = 'hyprlang',
    }
})

vim.cmd [[
    augroup _hyprlang_comments
	au!
	autocmd FileType hyprlang set commentstring=#\ %s
    augroup end
]]
