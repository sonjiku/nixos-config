return   {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = {
                        {'echasnovski/mini.nvim', version = false},
                        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<leader>", mode = { "n", "v" }, silent = true },
    },
    opts = {},
}
