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
option.laststatus = 3

-- Buffer Settings --
buffer.fileencoding = "utf-8"

-- Global Settings --
global.mapleader = " "

-- Key Mappings --
vim.keymap.set({ "n", "i", "v" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Right>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Down>", "<Nop>")

vim.keymap.set({ "n", "v" }, "<leader>y", '"*y', { noremap = true, silent = true })


vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")

-- vim.keymap.set("i", "<F1>", 'copilot#Accept("<CR>")', {noremap = true, silent = true, expr=true, replace_keycodes = false })
-- vim.keymap.set("i", "<F2>", "copilot#Next()", {noremap = true, silent = true, expr=true, replace_keycodes = false })
-- vim.keymap.set("i", "<F3>", "copilot#Previous()", {noremap = true, silent = true, expr=true, replace_keycodes = false })

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

vim.keymap.set("n", "<CR>", "a<CR><Esc>k$")

vim.keymap.set("n", "<Tab>", "<cmd>bNext<CR>", { silent = true })
vim.keymap.set("n", "<leader>bc", "<cmd>bd<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.schedule(function()
  vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })
  vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })
end)

vim.keymap.set({ "v", "n" } , "<leader>y", "\"+y")

vim.keymap.set({"i", "t"} , "jk", "<ESC>")
vim.keymap.set("n", "<leader>w", ":w", { silent = true })
vim.keymap.set("n", "<leader>q", ":q", { silent = true })
vim.keymap.set("n", "<leader>wq", ":wq", { silent = true })
vim.keymap.set("n", "<leader>w!", ":w!", { silent = true })
vim.keymap.set("n", "<leader>q!", ":q!", { silent = true })
vim.keymap.set("n", "<leader>wq!", ":wq!", { silent = true })

vim.keymap.set("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

vim.api.nvim_create_autocmd({"BufEnter"}, {
  pattern = "NvimTree_*",
  callback = function()
    vim.cmd("file NvimTree")
  end,
})


vim.cmd [[highlight SpelunkerSpellBad cterm=NONE ctermfg=247 gui=undercurl guisp=#ff1212 ]]

vim.g.copilot_no_tab_map = true

vim.api.nvim_set_hl(0, "@property", { fg = "#569CD6" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#7aa2f7", bg = "NONE" })
vim.opt.cmdheight = 1 

vim.api.nvim_create_autocmd('CmdlineLeave', {
    group = vim.api.nvim_create_augroup(
        'cmdheight_0_on_cmdlineleave',
        { clear = true }
    ),
    desc = 'Hide cmdline when not typing a command',
    command = ':set cmdheight=0',
})

vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup(
        'hide_message_after_write',
        { clear = true }
    ),
    desc = 'Get rid of message after writing a file',
    pattern = { '*' },
    command = 'redrawstatus',
})
