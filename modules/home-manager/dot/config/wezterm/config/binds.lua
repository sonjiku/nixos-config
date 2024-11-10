local wezterm = require("wezterm")
local platform = require('utils.platform')
-- local backdrops = require('utils.backdrops')
local act = wezterm.action

local mod = {}

if platform.is_mac then
    mod.SUPER = 'SUPER'
    mod.SUPER_REV = 'SUPER|CTRL'
elseif platform.is_win or platform.is_linux then
    mod.SUPER = 'ALT' -- to not conflict with Windows key shortcuts
    mod.SUPER_REV = 'ALT|CTRL'
end
local leader = { mods = mod.SUPER, key = 'q' }

return {
    -- eeader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 },
    leader = leader,
    mouse_bindings = {
        {
            event = { Down = { streak = 2, button = 'Left' } },
            action = wezterm.action.SelectTextAtMouseCursor 'Word',
            mods = 'NONE',
        },
        {
            event = { Down = { streak = 3, button = 'Left' } },
            action = wezterm.action.SelectTextAtMouseCursor 'Line',
            mods = 'NONE',
        },
        {
            event = { Down = { streak = 4, button = 'Left' } },
            action = wezterm.action.SelectTextAtMouseCursor 'SemanticZone',
            mods = 'NONE',
        },
    },
    keys = {
        { mods = 'CMD',        key = 'm',         action = act.DisableDefaultAssignment, },
        { mods = 'CTRL|SHIFT', key = 'Quote',     action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
        { mods = 'CTRL|SHIFT', key = 'Backslash', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
        { mods = 'SHIFT|ALT', key = 'q',         action = act.CloseCurrentPane { confirm = true } },

        { mods = 'SHIFT|ALT',      key = 'p',     action = act.ScrollByPage(-0.5), },
        { mods = 'SHIFT|ALT',      key = 'n',     action = act.ScrollByPage(0.5), },
        { mods = 'SHIFT|ALT', key = 'h',         action = act.ActivatePaneDirection 'Left', },
        { mods = 'SHIFT|ALT', key = 'j',         action = act.ActivatePaneDirection 'Down', },
        { mods = 'SHIFT|ALT', key = 'k',         action = act.ActivatePaneDirection 'Up', },
        { mods = 'SHIFT|ALT', key = 'l',         action = act.ActivatePaneDirection 'Right', },
        {
            mods = 'ALT|SHIFT',
            key = ')',
            action = act.PaneSelect {
                mode = 'SwapWithActive',
            },
        },

        { mods = 'CTRL|SHIFT',      key = 'h',     action = act.ActivateTabRelative(-1), },
        { mods = 'CTRL|SHIFT',      key = 'l',     action = act.ActivateTabRelative(1), },

        { mods = 'CTRL|SHIFT|ALT', key = 'h',     action = act.MoveTabRelative(-1), },
        { mods = 'CTRL|SHIFT|ALT', key = 'l',     action = act.MoveTabRelative(1), },

        { mods = 'CTRL|SHIFT',     key = 'Slash', action = act.Search("CurrentSelectionOrEmptyString"), },
        -- Leader binds
        { mods = 'LEADER|SHIFT',   key = '-',     action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
        { mods = 'LEADER|SHIFT',   key = '|',     action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
        { mods = 'LEADER|CTRL',    key = 'q',     action = act.SendKey(leader), },
        { mods = 'LEADER',         key = 'v',     action = act.ActivateCopyMode },
        { mods = 'LEADER',         key = 'p',     action = act.PasteFrom 'Clipboard' },
    },
    key_tables = {
        copy_mode = {
            -- Selection
            { key = "o", action = act.OpenLinkAtMouseCursor,         mods = "CTRL" },
            { key = "c", action = act.CopyMode "ClearSelectionMode", mods = "CTRL" },
            {
                key = "Escape",
                action = act.Multiple {
                    { CopyMode = 'MoveToScrollbackBottom' },
                    { CopyMode = 'Close' },
                },
            },
            {
                key = "v",
                action = act.CopyMode { SetSelectionMode = 'Cell' },
            },
            {
                mods = "SHIFT",
                key = "V",
                action = act.CopyMode { SetSelectionMode = 'Line' },
            },
            {
                mods = "CTRL",
                key = "v",
                action = act.CopyMode { SetSelectionMode = 'Block' },
            },
            {
                key = 'y',
                action = act.Multiple {
                    { CopyTo = 'ClipboardAndPrimarySelection' },
                    { CopyMode = 'MoveToScrollbackBottom' },
                    { CopyMode = 'Close' },
                },
            },
            { key = 'O', action = act.CopyMode 'MoveToSelectionOtherEndHoriz', },
            { key = 'o', action = act.CopyMode 'MoveToSelectionOtherEnd', },
            -- Jumps
            { key = ',', action = act.CopyMode 'JumpReverse' },
            { key = ";", action = act.CopyMode 'JumpAgain' },
            { key = "f", action = act.CopyMode { JumpForward = { prev_char = false } } },
            { key = "F", action = act.CopyMode { JumpBackward = { prev_char = false } } },
            { key = "t", action = act.CopyMode { JumpForward = { prev_char = true } } },
            { key = "T", action = act.CopyMode { JumpBackward = { prev_char = true } } },
            -- Scrollback
            { key = "g", action = act.CopyMode 'MoveToScrollbackTop' },
            { key = "G", action = act.CopyMode 'MoveToScrollbackBottom' },
            -- Viewport
            { key = "H", action = act.CopyMode 'MoveToViewportTop' },
            { key = "M", action = act.CopyMode 'MoveToViewportMiddle' },
            { key = "L", action = act.CopyMode 'MoveToViewportBottom' },
            -- Movements
            { key = '$', action = act.CopyMode 'MoveToEndOfLineContent',                mods = "SHIFT" },
            { key = '^', action = act.CopyMode 'MoveToStartOfLineContent',              mods = "SHIFT" },
            { key = '0', action = act.CopyMode 'MoveToStartOfLine' },
            { key = 'w', action = act.CopyMode 'MoveForwardWord' },
            { key = 'e', action = act.CopyMode 'MoveForwardWordEnd', },
            { key = 'b', action = act.CopyMode 'MoveBackwardWord', },
            { key = 'b', action = act.CopyMode 'PageUp',                                mods = 'CTRL' },
            { key = 'f', action = act.CopyMode 'PageDown',                              mods = 'CTRL' },
            { key = 'd', action = act.CopyMode { MoveByPage = 0.5 },                    mods = 'CTRL', },
            { key = 'u', action = act.CopyMode { MoveByPage = -0.5 },                   mods = 'CTRL', },
            -- Fine movement
            { key = "h", action = act.CopyMode 'MoveLeft' },
            { key = "j", action = act.CopyMode 'MoveDown' },
            { key = "k", action = act.CopyMode 'MoveUp' },
            { key = "l", action = act.CopyMode 'MoveRight' },
            -- Search
            -- { key = "/",    action = act.Search("CurrentSelectionOrEmptyString") },
            { key = "n", action = act.CopyMode 'NextMatch' },
            { key = "N", action = act.CopyMode 'PriorMatch' },
            { key = "/", action = act.CopyMode 'EditPattern' },
            {
                key = 'Enter',
                action = act.CopyMode 'MoveToStartOfNextLine',
            },
        },
        search_mode = {
            -- { key = "Escape", action = act.ActivateCopyMode },
            {
                key = "Escape",
                action = act.Multiple {
                    act.ActivateCopyMode,
                },
            },
            { key = "n", action = act.CopyMode 'NextMatch',  mods = "CTRL" },
            { key = "p", action = act.CopyMode 'PriorMatch', mods = "CTRL" },
            -- Go back to copy mode when pressing enter, so that we can use unmodified keys like "n"
            -- to navigate search results without conflicting with typing into the search area.
            {
                key = "Enter",
                action = act.Multiple {
                    { CopyMode = 'AcceptPattern' },
                    { CopyMode = 'NextMatch' },
                },
            },
        }
    }
}
