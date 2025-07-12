return {
    {
        "supermaven-inc/supermaven-nvim",
        enabled = true,
        config = function()
            require("supermaven-nvim").setup({
                log_level = "warn",
                disable_inline_completion = false, -- disables inline completion for use with cmp
            })
        end,
        vim.keymap.set("n", "<c-s>", ":SupermavenToggle<CR>"),
        vim.keymap.set("i", "<c-s>", "<esc>:SupermavenToggle<CR>t")
    },
}
