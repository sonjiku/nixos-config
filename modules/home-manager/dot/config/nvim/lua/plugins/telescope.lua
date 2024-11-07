-- Telescope fuzzy finding (all the things)
return {
        {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
                "ElPiloto/telescope-vimwiki.nvim",
                "nvim-telescope/telescope-media-files.nvim",
                "ahmedkhalf/project.nvim",
		"nvim-lua/plenary.nvim",
                "nvim-telescope/telescope-dap.nvim",
		-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
	},
	config = function()
            local actions = require("telescope.actions")

            require("telescope").setup({
                defaults = {

                    prompt_prefix = " ",
                    selection_caret = " ",
                    path_display = { "smart" },

                    mappings = {
                        i = {
                            ["<C-n>"] = actions.cycle_history_next,
                            ["<C-p>"] = actions.cycle_history_prev,
                            ["<M-j>"] = actions.move_selection_next,
                            ["<M-k>"] = actions.move_selection_previous,
                            ["<Down>"] = actions.move_selection_next,
                            ["<Up>"] = actions.move_selection_previous,
                            ["<C-c>"] = actions.close,
                            ["<CR>"] = actions.select_default,
                            ["<C-x>"] = actions.select_horizontal,
                            ["<C-v>"] = actions.select_vertical,
                            ["<C-t>"] = actions.select_tab,
                            ["<C-u>"] = actions.preview_scrolling_up,
                            ["<C-d>"] = actions.preview_scrolling_down,
                            ["<PageUp>"] = actions.results_scrolling_up,
                            ["<PageDown>"] = actions.results_scrolling_down,
                            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                            ["<C-l>"] = actions.complete_tag,
                            ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
                        },
                        n = {
                            ["<esc>"] = actions.close,
                            ["<CR>"] = actions.select_default,
                            ["<C-x>"] = actions.select_horizontal,
                            ["<C-v>"] = actions.select_vertical,
                            ["<C-t>"] = actions.select_tab,
                            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                            ["j"] = actions.move_selection_next,
                            ["k"] = actions.move_selection_previous,
                            ["H"] = actions.move_to_top,
                            ["M"] = actions.move_to_middle,
                            ["L"] = actions.move_to_bottom,
                            ["<Down>"] = actions.move_selection_next,
                            ["<Up>"] = actions.move_selection_previous,
                            ["gg"] = actions.move_to_top,
                            ["G"] = actions.move_to_bottom,
                            ["<C-u>"] = actions.preview_scrolling_up,
                            ["<C-d>"] = actions.preview_scrolling_down,
                            ["<PageUp>"] = actions.results_scrolling_up,
                            ["<PageDown>"] = actions.results_scrolling_down,
                            ["?"] = actions.which_key,
                        },
                    },
                },
            })

            local map = require("lib.key").map

            map("n", "<leader>tr", require("telescope.builtin").oldfiles, "Recently opened")
            map("n", "<leader>tb", require("telescope.builtin").buffers, "Open buffers")
            map('n', '<LEADER>tt', require("telescope.builtin").builtin, "Telescope")
            map('n', '<LEADER>tf', ':lcd %:h<CR>:Telescope find_files<CR>', "Files in CWD")
            map("n", "<leader>tp", require("telescope.builtin").find_files, "Files")
            map("n", "<leader>th", require("telescope.builtin").help_tags, "Help")
            map("n", "<leader>ts", require("telescope.builtin").spell_suggest, "Search keymaps")
            map("n", "<leader>tg", require("telescope.builtin").grep_string, "Current word")
            map("n", "<leader>tl", require("telescope.builtin").live_grep, "Grep")
            map("n", "<leader>td", require("telescope.builtin").diagnostics, "Diagnostics")
            map("n", "<leader>tk", require("telescope.builtin").keymaps, "Search keymaps")
            map('n', '<LEADER>tc', ':lcd ~/.config/nvim<CR>:Telescope find_files<CR>')

            local tsMf_ok = pcall(require("telescope").load_extension, "media_files")
            if tsMf_ok then
                map('n', '<LEADER>tw', ':Telescope media_files<CR>')
            end


            local tsFz_ok = pcall(require("telescope").load_extension, "fzf")
            if tsFz_ok then
            map("n", "<leader>t/", function()
            -- You can pass additional configuration to telescope to change theme, layout, etc.
            require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                    winblend = 10,
                    previewer = false,
                                }))
            end, "Search in current buffer")
            end

            local tsPr_ok = pcall(require("telescope").load_extension, "projects")
            if tsPr_ok then
                map('n', '<LEADER>tw', ':Telescope projects<CR>', "projects")
            end
            local tsVw_ok = pcall(require("telescope").load_extension, "vimwiki")
            if tsVw_ok then
                map('n', '<LEADER>tw', ':Telescope vimwiki<CR>', "Vimwiki")
            end
            local tsdap_ok = pcall(require("telescope").load_extension("dap"))
            if tsdap_ok then
                map('n', '<LEADER>tD', ':Telescope dap<CR>')
            end
        end
}}
