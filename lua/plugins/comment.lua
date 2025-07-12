return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup({
            sticky = true,
            toggler = {
                line = '!',
            },
            opleader = {
                block = '!',
            },
            mappings = {
                basic = true,
                extra = true,
            },
            extra = {
                above = 'O',
                below = 'E',
                eol = '\\'
            },
        })
    end,
}
