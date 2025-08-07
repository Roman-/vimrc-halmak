require("core.helpers")

vim.api.nvim_del_keymap('n', '<C-W><C-D>')
vim.api.nvim_del_keymap('n', '<C-W>d')

vim.keymap.set("n", "<Space>L", ":Lazy<CR>")
vim.keymap.set({ "n", "i" }, "<c-w>", SaveAndCloseBuffer)
vim.keymap.set({ "n", "i" }, "<F2>", RenameCurrentFile)
vim.keymap.set({ "n", "i" }, "<c-t>", ":silent! w<CR>:BufferRestore<CR>") -- should've been <c-s-t> but it's not working in terminal vim
vim.keymap.set("n", "<c-PageUp>", ":silent! w<CR>:BufferPrevious<CR>")
vim.keymap.set("i", "<c-PageUp>", "<esc>:silent! w<CR>:BufferPrevious<CR>")
vim.keymap.set("n", "<c-PageDown>", ":silent! w<CR>:BufferNext<CR>")
vim.keymap.set("i", "<c-PageDown>", "<esc>:silent! w<CR>:BufferNext<CR>")
vim.keymap.set({ "n", "i" }, "<S-PageDown>", "<esc>:BufferMoveNext<CR>")
vim.keymap.set({ "n", "i" }, "<S-PageUp>", "<esc>:BufferMovePrevious<CR>")
vim.keymap.set("n", "<M-p>", ":BufferPin<CR>")
vim.keymap.set("n", "<space>d", MoveFileToTrash)
vim.keymap.set("n", "<space>-", "I- <esc>") -- turn current line into list item
vim.keymap.set("n", "<space>g", ":BufferCloseAllButCurrent<CR>")

-- yank path (copy current filename to clipboard)
vim.keymap.set("n", "kf", ":let @+=expand(\"%:p\")<CR>:echom expand(\"%:p\")<CR>")
vim.keymap.set("n", "k~", ":let @+=expand(\"%:t:r\")<CR>:echom expand(\"%:t:r\")<CR>")

-- Consistently "delete prev word": mapping Ctrl-Backspace does not work in terminal Vim. Following is a workaround.
vim.keymap.set({ 'i', 'c' }, '<C-BS>', '<C-w>')
vim.keymap.set({ 'i', 'c' }, '<C-h>', '<C-w>')

-- arg-text-object
vim.api.nvim_set_keymap('n', 'd,', 'd<Plug>SidewaysArgumentTextobjA', { noremap = true })
vim.api.nvim_set_keymap('n', 'k,', 'y<Plug>SidewaysArgumentTextobjI', { noremap = true })
vim.api.nvim_set_keymap('n', 's,', 'c<Plug>SidewaysArgumentTextobjI', { noremap = true })

-- web: launch chrome
vim.api.nvim_create_user_command('I', '!google-chrome --allow-file-access-from-files --allow-file-access index.html', {})

-- H for help, launch in fullscreen
vim.api.nvim_create_user_command('H', 'help <args> | silent only', { nargs = 1, complete = 'help' })

-- Idea's 'focus editor', where editor is IDE on workspace 2
vim.api.nvim_set_keymap('n', '<c-r>', ':!i3-msg "workspace number 2"<cr><cr>', { noremap = true })

-- Dealing with hard line breaks
vim.api.nvim_set_keymap('', 'e', [[v:count == 0 ? 'g<down>' : 'j']], {expr = true, noremap = true})
vim.api.nvim_set_keymap('', 'o', [[v:count == 0 ? 'g<up>' : 'k']], {expr = true, noremap = true})

-- Execute the current file
vim.keymap.set("n", "<F9>", ":w<CR>:!%:p<CR>")
