require("lib.env")
local setopt = require("lib.config").setopt
local homed = os.getenv("HOME")

-- General
setopt({
    compatible = false,
    modelines = 0,
    fileencoding = "utf-8",
    mouse = "nvic",
    mousescroll = "ver:1,hor:1",
    -- clipboard = 'unnamedplus',
    history = 100,
    shada = "'1000,f1,<500,:50,@50,/20,n"
	.. homed
	.. "/.local/share/nvim/shada/main.shada",
    directory = homed .. "/.local/share/nvim/swap",
    swapfile = false,
    backupdir = homed .. "/.local/share/nvim/backup",
    backup = false,
    writebackup = false,
    undodir = homed .. "/.local/share/nvim/undo",
    undofile = true,
    undolevels = 1000,
    sessionoptions = "buffers,tabpages,winsize,options,folds",
})

-- Performance
setopt({
    updatetime = 300,
    hidden = true,
    lazyredraw = true,
    ttyfast = true,
    synmaxcol = 240,
})

-- UI
setopt({
    number = true,
    relativenumber = true,
    guicursor = "i-c:ver20-blinkwait1-blinkon50-blinkoff50,r:hor20,v:block,n:block-blinkwait1-blinkon50-blinkoff50",
    colorcolumn = '80',
    cursorline = true,
 -- wrap on word boundary
    linebreak = true,
 -- Always show tabline
    showtabline = 2,
 -- Always show statusline
    laststatus = 2,
    showcmd = false,
    cmdheight = 2,
    showmode = false,
    scrolloff = 5,
    wildmenu = true,
    wildignore = "*.o,*.class,*.pyc,*.jpg,*.jpeg,*.png,*.gif,*.zip,*.DS_Store",
 -- Pop-Up-Menu height
    -- pumheight = 100,
 -- mostly just for cmp
    completeopt = { "menuone", "noselect" },
    splitright = true,
    splitbelow = true,
    showmatch = true,
    incsearch = true,
    ignorecase = true,
    smartcase = true,
    hlsearch = true,
})

-- Folds
setopt({
    foldenable = false,
    foldmethod = 'indent',
    foldlevelstart = 0,
    foldnestmax = 3,
})

-- Indent
setopt({
 -- Make tabs spaces
    expandtab = true,
 -- Full tab width in characters
    tabstop = 8,
 -- Indent width
    shiftwidth = 4,
 -- Stupid nonsense
    softtabstop = -1,
 -- Round indent to multiple of shiftwidth
    shiftround = true,
 -- Stupid
    smarttab = true,
 -- Auto indent new lines
    autoindent = true,
 -- Do it smartly
    smartindent = true,
})

-- Syntax and ft features
vim.cmd [[
    syntax enable
    filetype indent on
    filetype plugin on
    set whichwrap+=<,>,[,],h,l
    set keymap=greek
    set iminsert=0
]]

-- -- Virtual editing of file for easy table editing.
-- setopt(opt{virtualedit = "all"})
-- -- Word boundry linebreaks 
-- setopt(opt{linebreak = true})
-- setopt(opt{breakindent = true})
-- -- Autolinebreaks
-- setopt(opt{textwidth = 30})
-- -- Prepend to linebreaks to make them obvious
-- setopt(opt{showbreak='++  '})
-- setopt(opt{columns = 80})

-- Theme
vim.cmd [[set termguicolors background=dark]]
local colorscheme = require("lib.colorscheme")
vim.cmd.colorscheme(colorscheme)


-- vim.cmd "hi Normal guibg=0 ctermbg=0" -- Make background color same as terminal in case of transparency
