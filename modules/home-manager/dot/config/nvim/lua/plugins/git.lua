-- Git related plugins
return {
	{
            "lewis6991/gitsigns.nvim",
            opts = {},
            config = function ()
                require("gitsigns").setup()
                local map = require("lib.key").map
                map("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", "Line Blame")
                map("n", "<leader>gB", "<cmd>Gitsigns blame<cr>", "Show the blame")
                map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", "Preview line diff")
            end
	},
	{
		"akinsho/git-conflict.nvim",
		commit = "2957f74",
		config = function()
			require("git-conflict").setup({
				default_mappings = {
					ours = "co",
					theirs = "ct",
					none = "c0",
					both = "cb",
					next = "cn",
					prev = "cp",
				},
			})
		end,
	},
	{
		"tpope/vim-fugitive",
		config = function ()
			local map = require("lib.key").map
			map("n", "<leader>ga", "<cmd>Git add .<cr>", "Stage the current file")
			map("n", "<leader>gA", "<cmd>Git add ./*<cr>", "Stage all files in cwd")
			map("n", "<leader>gg", "<cmd>Git commit<cr>", "Commit")
		end
	}
}
