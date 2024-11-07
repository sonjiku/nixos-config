local cmd = vim.cmd;
local api = vim.api;
local lsp = vim.lsp;
local fn = vim.fn;
local g = vim.g;
local opt = vim.opt;
local homed = os.getenv("HOME")

-- Python Enable
g.python3_host_prog = "/usr/bin/python3"
g.python_host_prog = "/usr/bin/python2"

-- Netrw
g.netrw_home = homed .. '/.cache/vim/'
-- g.netrw_banner = 0 -- Disables Banner
-- g.netrw_browse_split=4 -- Open in prior window
-- -- g.netrw_altv = "&spr" -- Open splits to the right 
-- g.netrw_altv = 1 -- Open splits to the right
-- g.netrw_altfile = 0 -- ctl-^ back to browsing view
-- g.netrw_liststyle = 3 -- Tree View
-- g.netrw_decompress = {
--     gz  = 'gunzip',
--     bz2 = 'bunzip2',
--     zip = 'unzip',
--     tar = 'tar -xf'
--     }
-- --g.netrw_list_hide = fn.['netrw_gitignore#Hide']()
-- g.netrw_hide=1
-- -- g.netrw_list_hide.=',\(^\|\s\s)\zs\.\S\+'
-- g.netrw_winsize = -30 -- absolute width of netrw window
-- -- g.netrw_sort_sequence = '[\/]$,*' -- Directories on the top, files below
