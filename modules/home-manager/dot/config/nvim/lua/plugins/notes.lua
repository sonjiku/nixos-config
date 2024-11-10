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
                md = {
                    link_type = 'md',
                    url_extension = '',
                    url_transform = function(x)
                        local result = string.gsub(string.lower(x), '%s+', '-')
                        return result
                    end,
                },
                org = {
                    link_type = 'org',
                    url_extension = '.org',
                },
                adoc = {
                    link_type = 'adoc_xref_bracket',
                    url_extension = '',
                },
                _ = {
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
    {
        "itchyny/calendar.vim"
    },
    -- {
    --     "preservim/vim-pencil",
    -- }
}
