vim.opt.mouse = ""
vim.opt.termguicolors = true

-- persistent_undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("$HOME/.vim/undo")
vim.opt.undolevels = 100
vim.opt.undoreload = 10000

-- shada
vim.opt.shada = "!,'2000,<150,s10,h"

vim.api.nvim_create_autocmd({"BufWinLeave", "BufWrite"}, {
    pattern = "?*",
    command = "silent! mkview"
})

vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "?*",
    command = "silent! loadview"
})

vim.opt.hidden = true

vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.copyindent = true

-- Set list
vim.opt.list = true
vim.opt.listchars = { tab = '› ', trail = '•', extends = '#', nbsp = '.' } -- Highlight problematic whitespace
vim.opt.joinspaces = false

-- highlight text when yanked
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    command = "silent! lua vim.highlight.on_yank({higroup='Visual', timeout=150})"
})
