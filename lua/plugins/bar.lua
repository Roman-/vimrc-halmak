return {
    "romgrk/barbar.nvim",
    config = function()
        require("barbar").setup({
            always_show_bufferline = true,
            animation = false,
            separator = {left = '▎', right = '▌'},
        })
    end,
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
}