return {
    {
        "folke/twilight.nvim",
        config = function()
            require("twilight").setup({
                dimming = {
                    alpha = 0.25, -- amount of dimming
                    -- we try to get the foreground from the highlight groups or fallback color
                    color = { "Normal", "#ffffff" },
                    term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
                    inactive = false,    -- when true, other windows will be fully dimmed (unless they contain the same buffer)
                },
                context = 10,            -- amount of lines we will try to show around the current line
                treesitter = true,       -- use treesitter when available for the filetype
                -- treesitter is used to automatically expand the visible text,
                -- but you can further control the types of nodes that should always be fully expanded
                expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
                    "function",
                    "method",
                    "table",
                    "if_statement",
                },
                exclude = {}, -- exclude these filetypes
            })
        end
    },
    {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup({
                window = {
                    backdrop = 0.95,
                    width = 120,
                    height = 1,
                    options = {
                        -- signcolumn = "no", -- disable signcolumn
                        -- number = false, -- disable number column
                        -- relativenumber = false, -- disable relative numbers
                        cursorline = false, -- disable cursorline
                        -- cursorcolumn = false, -- disable cursor column
                        -- foldcolumn = "0", -- disable fold column
                        -- list = false, -- disable whitespace characters
                    },
                },
                plugins = {
                    options = {
                        enabled = true,
                        ruler = false,              -- disables the ruler text in the cmd line area
                        showcmd = false,            -- disables the command in the last line of the screen
                    },
                    twilight = { enabled = true },  -- enable to start Twilight when zen mode opens
                    gitsigns = { enabled = false }, -- disables git signs
                    tmux = { enabled = false },     -- disables the tmux statusline
                    kitty = {
                        enabled = false,
                        font = "+4",
                    },
                    alacritty = {
                        enabled = false,
                        font = "14",
                    },
                },
                -- callback where you can add custom code when the Zen window opens
                on_open = function(win)
                end,
                -- callback where you can add custom code when the Zen window closes
                on_close = function()
                end,
            })
        end
    }
}
