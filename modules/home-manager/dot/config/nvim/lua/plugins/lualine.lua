-- Fancier statusline
return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local colorscheme = require("lib.colorscheme")
		local lualine_theme = colorscheme == "default" and "auto" or colorscheme
		require("lualine").setup({
			options = {
				icons_enabled = true,
				-- theme = lualine_theme,
				theme = "auto",
				component_separators = "|",
				section_useparators = "",
			},
		})
	end,
}
