local M = {}

M.setopt = function(options)
	for key, value in pairs(options) do
	    vim.opt[key] = value
	end
end

return M
