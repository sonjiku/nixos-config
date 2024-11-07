-- Note Taking
return {
    {
        branch = "heading-id",
        "sonjiku/wiki.vim",
        -- event = "BufEnter *.md",
        init = function()
            local notedir = vim.fn.expand('~/documents/notes')
            vim.g.wiki_root = notedir
            vim.g.wiki_link_creation = {
                md= {
                    link_type = 'md',
                    url_extension = '',
                    url_transform = function(x)
                        local result = string.gsub(string.lower(x), '%s+', '-')
                        return result
                    end,
                },
                org= {
                    link_type = 'org',
                    url_extension = '.org',
                },
                adoc= {
                    link_type = 'adoc_xref_bracket',
                    url_extension = '',
                },
                _= {
                    link_type = 'wiki',
                    url_extension = '',
                },
            }
            vim.g.wiki_link_transform_on_follow = 1
            vim.g.wiki_journal = {
                root = notedir .. "/journal",
                frequency = "daily"
            }
            -- vim.g.wiki_mappings_global = {
            --     [<plug>(wiki-reload)] = '<leader>wx',
            --     [<plug>(wiki-export)] = '<c-p>',
            -- }
            -- vim.g.wiki_mappings_local_journal = {
            --     '<plug>(wiki-journal-prev)' : '[w',
            --     '<plug>(wiki-journal-next)' : ']w',
            -- }
            vim.g.wiki_ui_method = {
                confirm = 'nvim',
                input = 'nvim',
                select = 'nvim',
            }
            local map = ""
            require("lib.key").map('n', '<Leader>wj', ':WikiJournal<CR>', "Wiki Journal")
            require("lib.key").map('n', '<Leader>wo', ':WikiOpen<CR>', "Wiki Open")
            require("lib.key").map('n', '<Leader>wn', ':WikiLinkNext<CR>', "Go to next link")
            require("lib.key").map('n', '<Leader>wp', ':WikiLinkPrev<CR>', "Go to next link")
        end,
    },
    -- {
    --     "SidOfc/mkdx",
    --     init = function()
    --         vim.cmd[[
    --             let g:mkdx#settings = { 'map': { 'prefix': '<leader>m' } }
    --             let g:mkdx#settings = { 'links': { 'conceal': 1 } }
    --         ]]
    --     end,
    -- },
    {
        "preservim/vim-markdown"
    },
    {
        "itchyny/calendar.vim"
    },
    {
        "ellisonleao/glow.nvim", config = true, cmd = "Glow"
    },
    {
        'Kicamon/markdown-table-mode.nvim',
        config = function()
            require('markdown-table-mode').setup()
        end
    },
}



    -- {
    --     "vimwiki/vimwiki",
    --     branch = "dev",
    --     lazy = true,
    --     -- event = "BufEnter *.md",
    --     -- keys = { "<leader>ww", "<leader>wt" },
    --     keys = { "<leader>w" },
    --     init = function()
    --         vim.g.vimwiki_folding = ""
    --         local notedir = vim.fn.expand('~/documents/notes')
    --         -- Only work on files in ~/documents/notes
    --         vim.g.vimwiki_global_ext = 0
    --         vim.g.vimwiki_markdown_link_ext = 1
    --         -- Vimwiki is superslow when concealing
    --         vim.g.vimwiki_conceallevel = 0
    --         -- Syntax used depending on extention
    --         vim.g.vimwiki_ext2syntax = {
    --             [".md"] = "markdown",
    --             [".markdown"] = "markdown",
    --             [".mdown"] = "markdown",
    --         }
    --         -- Different Wikis
    --         vim.g.vimwiki_list = {
    --         {
    --             name = "General",
    --             path = notedir .. "/general",
    --             autotoc = 1,
    --             links_space_char = "_",
    --             syntax = 'markdown',
    --             ext = '.md' },
    --         {
    --             name = "Music",
    --             path = notedir .. "/music",
    --             autotoc = 1,
    --             links_space_char = "_",
    --             syntax = 'markdown',
    --             ext = '.md' },
    --         {
    --             name = "Primeval Existence",
    --             path = notedir .. "/primeval-existence",
    --             autotoc = 1,
    --             links_space_char = "_",
    --             syntax = 'markdown',
    --             ext = '.md' },
    --         {
    --             name = "DnD Campaign",
    --             path = notedir .. "/fpa",
    --             autotoc = 1,
    --             links_space_char = "_",
    --             syntax = 'markdown',
    --             ext = '.md' },
    --         {
    --             name = "Saul Gouda Broductions",
    --             path = notedir .. "/goudabros",
    --             autotoc = 1,
    --             links_space_char = "_",
    --             syntax = 'markdown',
    --             ext = '.md' },
    --         }
    --     end
    -- },
    -- {
    --     'serenevoid/kiwi.nvim',
    --     dependencies = { 'nvim-lua/plenary.nvim' },
    --     lazy = true,
    --     opts = {
    --         {
    --             name = "notes",
    --             path = "~/documents/notes/"
    --         },
    --         {
    --             name = "Dnd Campaign",
    --             path = "~/documents/notes/fpa/"
    --         },
    --         {
    --             name = "Music",
    --             path = "~/documents/notes/music/"
    --         },
    --         {
    --             name = "Primeval existence",
    --             path = "~/documents/notes/primeval-existence/"
    --         },
    --         {
    --             name = "Saul Gouda Bros",
    --             path = "~/documents/notes/goudabros/"
    --         },
    --         {
    --             name = "Journal",
    --             path = "~/documents/notes/journal/"
    --         },
    --     },
    --     keys = {
    --         { "<leader>ww", ":lua require(\"kiwi\").open_wiki_index()<cr>", desc = "Open Wiki index" },
    --     },
    -- },
