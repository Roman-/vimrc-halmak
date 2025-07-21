return {
    "nvim-telescope/telescope.nvim",
    config = function()
        require("telescope").setup({
            pickers = {
                colorscheme = {
                    enable_preview = true
                }
            },
            defaults = {
                mappings = {
                    i = {
                        ["<esc>"] = require("telescope.actions").close,
                    },
                },
                file_ignore_patterns = { ".git/", ".cache/", "node_modules/" },
                prompt_prefix = " ",
                entry_prefix = "  ",
                initial_mode = "insert",
                selection_strategy = "reset",
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                        results_width = 0.8,
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.87,
                    height = 0.80,
                    preview_cutoff = 120,
                },
            },
        })

        -- Without the extension it would've been: vim.keymap.set("n", "<space>t", ":Telescope find_files<CR>")
        require('telescope').load_extension('recent-files')
        vim.keymap.set('n', '<space>t', function()
            require('telescope').extensions['recent-files'].recent_files({})
        end, { noremap = true, silent = true })

        vim.keymap.set("n", "<space>s", ":Telescope live_grep<CR>")
        vim.keymap.set("n", "<space>S", ":Telescope spell_suggest<CR>")
        vim.keymap.set("n", "<space>:", ":Telescope command_history<CR>")
        vim.keymap.set("n", "<space>.", ":Telescope oldfiles<CR>")
        vim.keymap.set("n", "<space>/", ":Telescope search_history<CR>")
    end,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'mollerhoj/telescope-recent-files.nvim',
        -- 'nvim-telescope/telescope-frecency.nvim',
    }
}
