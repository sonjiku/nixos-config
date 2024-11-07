local map = require("lib.key").map
local set_leader = require("lib.key").set_leader
local setopt = require("lib.config").setopt

setopt({timeoutlen = 750})
setopt({timeout = true})
setopt({
    langmap=[[ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz,йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\;,э',яz,чx,сc,мv,иb,тn,ьm,б\,,ю.,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж:,Э\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>]],
    langremap=true,
})
set_leader(" ")

-- Help window
map('n', '<F1>', ':help index<CR><C-W>T:tabmove<CR>', "Open help in new tab")
map('n', '<leader><space>z<space>', ':qall!<CR>', "Quit everything")
-- Toggle numbercolumn
map('n', '<F2>', ':set relativenumber!<CR>:set number!<CR>', "Toggle numbers")
-- Toggle folds
map('n', '<LEADER><F2>', ':set foldenable!<CR>', "Toggle folds")
-- Toggle spellcheck
map('n', '<F3>', ':setlocal spell! spelllang=en,el<CR>', "Toggle spellchecking")
-- Source current file
map('n', '<F4>', ':luafile %<CR>', "Source current lua file")
-- Edit config
map('n', '<LEADER>ec', ':e ~/.config/nvim/init.lua<CR>', "Edit config")
map('n', '<LEADER>cd', ':lcd %:h<CR>', "cd to this file's dir")
-- map('n', '<LEADER>w', ':w<CR>')
-- Timestamp
map('n', 'ts', ":r! date '+\\%d-\\%m-\\%Y \\%H:\\%M'<CR>", "Add timestamp")

-- Session saving and loading     
map('n', '<F12>', 'source ~/.cache/nvim/sessions/', "Load session")
map('n', '<LEADER><F12>', ':wall<CR>:mksession! ~/.cache/nvim/sessions/', "Save session as")

-- Tab
map('n', '<LEADER><F11>', '<C-w>T', "Move all splits to tabs")
map('n', '<LEADER><SPACE><F12>',':tab ball<CR>', "Tab ball")

-- Better window navigation
map("n", "<C-h>", "<C-W>h", "Move to left split")
map("n", "<C-j>", "<C-W>j", "Move to down split")
map("n", "<C-k>", "<C-W>k", "Move to up split")
map("n", "<C-l>", "<C-W>l", "Move to right split")
-- Resize with arrows
map("n", "<C-UP>", ":resize -2<CR>", "Smaller split width")
map("n", "<C-DOWN>", ":resize +2<CR>", "Larger split width")
map("n", "<C-LEFT>", ":vertical resize -2<CR>", "Smaller split height")
map("n", "<C-RIGHT>", ":vertical resize +2<CR>", "Larger split height")

-- Deleting buffers
-- map('n', '<LEADER>bz', ':bdelete<CR>', "Delete buffer")
-- map('n', '<LEADER>bw', ':w<CR>:bdelete<CR>', "Save, then delete buffer")
local buffers = require("lib.buffers")
map("n", "<leader>z", buffers.delete_this, " Delete current buffer")
map("n", "<leader>Z", buffers.delete_others, "Delete other buffers")
map("n", "<leader>bc", buffers.delete_all, "Delete all buffers")
-- Navigate buffers
map("n", "L", ":bnext<CR>", "Next buffer")
map("n", "H", ":bprevious<CR>", "Previous buffer")

-- QOL
map('x', "<leader>p", [["_dP]])
map({'n', 'v'}, '<leader>dx', '"_d')
map({'n', 'v'}, '<leader>y', '"+y')
map('n', '<leader>Y', '"+Y')
map('n', '-', '$')
map('n', 'Y', 'y$')
map('n', 'j', 'gj')
map('n', 'k', 'gk')
-- Empty lines
map('n', '<LEADER>o', 'mzo<ESC>`z')
map('n', '<LEADER>O', 'mzO<ESC>`z')
-- Select all
map('n', 'gV', "'[v']$")
-- Go to matching symbol
map('n', '<M-TAB>', '%')
-- Better jumping arround
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
-- Cursor doesn't move
map('n', 'J', "mzJ`z")

-- Easy tabbing
map('n', '<TAB>', '>>')
map('n', '<S-TAB>', '<<')
map("v", "<TAB>", ">gv")
map("v", "<S-TAB>", "<gv")

-- Move text up and down
map('n', '<M-k>', ':m .-2<CR>V=')
map('n', '<M-j>', ':m .+1<CR>V=')
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
--map("v", "p", '"_dP')

-- Better terminal navigation
map("t", "<C-H>", "<C-\\><C-N><C-W>h")
map("t", "<C-J>", "<C-\\><C-N><C-W>j")
map("t", "<C-K>", "<C-\\><C-N><C-W>k")
map("t", "<C-L>", "<C-\\><C-N><C-W>l")

-- Change everything under the cursor
-- map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])



-- Switch between light and dark modes
map("n", "<leader>ut", function()
	if vim.o.background == "dark" then
		vim.o.background = "light"
	else
		vim.o.background = "dark"
	end
end, "Toggle between light and dark themes")

-- Clear after search
map("n", "<leader>ch", "<cmd>nohl<cr>", "Clear highlights")

require('core.keymaps.gr')
