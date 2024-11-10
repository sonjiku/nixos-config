return {
    -- behaviours
    automatically_reload_config = true,
    exit_behavior = 'CloseOnCleanExit', -- if the shell program exited with a successful status
    -- exit_behavior = "Hold",
    exit_behavior_messaging = 'Verbose',
    status_update_interval = 1000,
    scrollback_lines = 20000,
    adjust_window_size_when_changing_font_size = false,


    enable_wayland = true,
    front_end = "OpenGL",
    webgpu_power_preference = "HighPerformance",
    -- front_end="OpenGL",
    check_for_updates = false,
    treat_left_ctrlalt_as_altgr = true,
    -- hyperlink_rules = wezterm.default_hyperlink_rules()
    hyperlink_rules = {
        -- Matches: a URL in parens: (URL)
        {
            regex = '\\((\\w+://\\S+)\\)',
            format = '$1',
            highlight = 1,
        },
        -- Matches: a URL in brackets: [URL]
        {
            regex = '\\[(\\w+://\\S+)\\]',
            format = '$1',
            highlight = 1,
        },
        -- Matches: a URL in curly braces: {URL}
        {
            regex = '\\{(\\w+://\\S+)\\}',
            format = '$1',
            highlight = 1,
        },
        -- Matches: a URL in angle brackets: <URL>
        {
            regex = '<(\\w+://\\S+)>',
            format = '$1',
            highlight = 1,
        },
        -- Then handle URLs not wrapped in brackets
        {
            regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
            format = '$0',
        },
        -- implicit mailto link
        {
            regex = '\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b',
            format = 'mailto:$0',
        },
        -- make task numbers clickable
        -- the first matched regex group is captured in $1.
        {
            regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
            format = 'https://www.github.com/$1/$3',
        },
        -- make username/project paths clickable. this implies paths like the following are for github.
        -- ( "nvim-treesitter/nvim-treesitter" | wbthomason/packer.nvim | wez/wezterm | "wez/wezterm.git" )
        -- as long as a full url hyperlink regex exists above this it should not match a full url to
        -- github or gitlab / bitbucket (i.e. https://gitlab.com/user/project.git is still a whole clickable url)
        {
            regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
            format = 'https://www.github.com/$1/$3',
        },
    },
}
