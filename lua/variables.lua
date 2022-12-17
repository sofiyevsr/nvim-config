local o = vim.o
local g = vim.g

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.mapleader = " "
g.tokyonight_style = "night"

vim.cmd [[colorscheme tokyonight-night]]

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.ejs" },
  callback = function()
    o.filetype = "html"
  end,
})

o.foldcolumn = '1' -- '0' is not bad
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true
o.guicursor = ""
o.mouse = ""
o.belloff = ""
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.relativenumber = true
o.expandtab = true
o.nu = true
o.ignorecase = true
o.smartcase = true
o.undofile = true
o.undodir = vim.fn.expand('~/.vim/undodir')
o.hidden = true
o.termguicolors = true
o.scrolloff = 8
o.backspace = "indent,eol,start"
o.updatetime = 300
o.shortmess = o.shortmess .. "c"
o.signcolumn = "yes"
