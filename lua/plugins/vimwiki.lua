return {
    {
        "vimwiki/vimwiki",
        -- only enable pluging if I open index.md
        enabled = function()
            return vim.fn.expand("%:t") == "index.md"
        end,
        init = function()
            -- /home/lo/.local/share/nvim/lazy/vimwiki/autoload/vimwiki/vars.vim (line 163)
            vim.g.vimwiki_key_mappings = { all_maps = 0 }

            vim.keymap.set("n", "y", "<Plug>VimwikiListo")
            vim.keymap.set("n", "z", "<Plug>VimwikiListO")
            vim.keymap.set("n", "I", ":VimwikiIndex<CR>")
            vim.keymap.set("n", "R", ":e ab_radix.md<CR>")
            vim.keymap.set("n", "B", ":e buy.md<CR>")
            vim.keymap.set("n", "gt", ":VimwikiFollowLink<CR>")
            vim.keymap.set("n", "<Tab>", ":VimwikiNextLink<CR>")
            vim.keymap.set("n", "<S-Tab>", ":VimwikiPrevLink<CR>")
            vim.keymap.set("n", "<space>x", ":wa!<cr>:VimwikiIndex<CR>:BufferCloseAllButCurrent<CR>")
            vim.keymap.set("n", "<space>g", CloseOtherTabsButKeepIndex)
            vim.keymap.set("n", "+", ":VimwikiGoto scratch<cr>ggVG\"_s")
            vim.keymap.set("n", "<space>u", ":VimwikiGoto ")
            vim.api.nvim_set_keymap('v', '<F2>', ":VimwikiRenameFile<CR>", { noremap = true })
            vim.api.nvim_set_keymap('n', '±', ':execute "edit " . system("ls *.md | shuf -n 1")<cr>', { noremap = true })

            vim.opt.expandtab = true
            vim.g.vimwiki_conceallevel = 0
            vim.g.vimwiki_autowriteall = 1
            vim.opt.cursorcolumn = false

            -- Omnicompletion with c-o
            vim.api.nvim_set_keymap('i', '<c-o>', '<c-x><c-o>', { noremap = true })
            -- Surround with [[]]
            vim.api.nvim_set_keymap('n', '<c-l>', '"xciw[[<c-r>x]]<esc><left><left>', { noremap = true })
            vim.api.nvim_set_keymap('i', '<c-l>', '[[]]<left><left>', { noremap = true })
            vim.api.nvim_set_keymap('v', '<c-l>', '"xc[[<c-r>x]]<esc><left><left>', { noremap = true })

            -- For some reason, links are not highlighted in vimwiki, even if you add this command at startup, it's overriden :(
            -- So this is a workaround
            vim.api.nvim_create_autocmd("BufWinEnter", {
                pattern = "*.md",
                command = [[
                syntax match CustomLinkPattern "http[s]\?:\/\/[^\t ]\+"
                syntax match TODO /\<TODO\>/
                ]]
            })

        end,
    }
}
