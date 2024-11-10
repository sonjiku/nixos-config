local wezterm = require('wezterm')
-- local platform = require('utils.platform')
return {
    allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace",
    treat_east_asian_ambiguous_width_as_wide = false,

    font = wezterm.font_with_fallback {
        {
            family = 'FiraCode Nerd Font Mono',
            weight = 'Medium',
            harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' },
        },
        'Noto Color Emoji'
    },
    font_size = 14.0,
    font_dirs = {
        'fonts',
        '/run/current-system/sw/share/X11/fonts',
    },
    window_frame = {
        -- The font used in the tab bar.
        -- Roboto Bold is the default; this font is bundled
        -- with wezterm.
        -- Whatever font is selected here, it will have the
        -- main font setting appended to it to pick up any
        -- fallback fonts you may have used there.
        font = wezterm.font_with_fallback {
            {
                family = 'JetBrainsMono Nerd Font Mono',
                weight = 'Medium',
                harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
            },
            'Noto Color Emoji'
        },
        font_size = 10.0,

        -- The overall background color of the tab bar when
        -- the window is focused
        -- active_titlebar_bg = '#333333',

        -- The overall background color of the tab bar when
        -- the window is not focused
        -- inactive_titlebar_bg = '#333333',
    },
    text_blink_rate = 1000,
    cursor_thickness = "0.1cell",
    underline_thickness = "0.1cell",
}

