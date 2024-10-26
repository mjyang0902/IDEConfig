local option = vim.opt
local buffer = vim.b
local global = vim.g

-- Global Settings --
option.showmode = false
option.backspace = { "indent", "eol", "start" }
option.tabstop = 4
option.shiftwidth = 4
option.expandtab = true
option.shiftround = true
option.autoindent = true
option.smartindent = true
option.number = true
option.relativenumber = true
option.wildmenu = true
option.hlsearch = false
option.ignorecase = true
option.smartcase = true
option.completeopt = { "menuone", "noselect" }
option.cursorline = true
option.termguicolors = true
option.signcolumn = "yes"
option.autoread = true
option.title = true
option.swapfile = false
option.backup = false
option.updatetime = 50
option.mouse = "a"
option.undofile = true
option.undodir = vim.fn.expand('$HOME/.local/share/nvim/undo')
option.exrc = true
option.wrap = false
option.splitright = true
option.conceallevel = 2
option.fillchars = { eob = " " }

-- Buffer Settings --
buffer.fileencoding = "utf-8"

-- Global Settings --
global.mapleader = " "
global.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"

-- Key Mappings --
vim.keymap.set({ "n", "i", "v" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Right>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Down>", "<Nop>")

vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

--vim.keymap.set("t", "<C-h>", "<C-w>h")
--vim.keymap.set("t", "<C-l>", "<C-w>l")
--vim.keymap.set("t", "<C-j>", "<C-w>j")
--vim.keymap.set("t", "<C-k>", "<C-w>k")
--
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
vim.keymap.set('t', 'jk', [[<C-\><C-n>]])

vim.keymap.set("n", "<CR>", "a<CR><Esc>k$")

vim.keymap.set("n", "<Tab>", "<cmd>bNext<CR>", { silent = true })
vim.keymap.set("n", "<leader>bc", "<cmd>bd<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({ "v", "n" } , "<leader>y", "\"+y")

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<leader>w", ":w", { silent = true })
vim.keymap.set("n", "<leader>q", ":q", { silent = true })
vim.keymap.set("n", "<leader>wq", ":wq", { silent = true })
vim.keymap.set("n", "<leader>w!", ":w!", { silent = true })
vim.keymap.set("n", "<leader>q!", ":q!", { silent = true })
vim.keymap.set("n", "<leader>wq!", ":wq!", { silent = true })

vim.keymap.set("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })


