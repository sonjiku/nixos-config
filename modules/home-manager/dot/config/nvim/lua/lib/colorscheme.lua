-- Fetch and setup colorscheme if available, otherwise just return 'default'
-- This should prevent Neovim from complaining about missing colorschemes on first boot
local function get_if_available(name, opts)
    local vim_ok, _ = pcall(vim.cmd.colorscheme, name)
    if vim_ok then
        local lua_ok, colorscheme = pcall(require, name)
        if lua_ok then
            if colorscheme["setup"] ~= nil then
                colorscheme.setup(opts)
            end
        end
        return name
    else
        return "default"
    end
end

-- Uncomment the colorscheme to use
local colorscheme = get_if_available("catppuccin-mocha")
-- local colorscheme = get_if_available("calvera")
-- local colorscheme = get_if_available("omni")
-- local colorscheme = get_if_available("moonlight")
-- local colorscheme = get_if_available('gruvbox')
-- local colorscheme = get_if_available('rose-pine')
-- local colorscheme = get_if_available('kanagawa')
-- local colorscheme = get_if_available('yawnc')
-- local colorscheme = get_if_available('default')
-- local colorscheme = get_if_available('carbonfox')
-- local colorscheme = get_if_available('everforest')
-- local colorscheme = get_if_available('melange')

return colorscheme
