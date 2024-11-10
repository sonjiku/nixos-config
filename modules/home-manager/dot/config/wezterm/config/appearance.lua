local wezterm = require('wezterm')

local function scheme_for_appearance(appearance)
    if appearance:find "Dark" then
        return "Gattopuccin Mocha"
    else
        return "Gattopuccin Latte"
    end
end

return {
    -- window_decorations = "TITLE | RESIZE",
    window_decorations = "NONE",
    window_background_opacity = 0.80,
    text_background_opacity = 0.8,
    color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
    -- color_scheme_dirs = { 'schemes' },
    enable_tab_bar = true,
    use_fancy_tab_bar = false,
    hide_tab_bar_if_only_one_tab = true,
    enable_scroll_bar = true,
}
