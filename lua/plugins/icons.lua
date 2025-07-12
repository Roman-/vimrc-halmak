return {
    "kyazdani42/nvim-web-devicons",
    config = function()
        require("nvim-web-devicons").setup({
            override_by_filename = {
                ["index.md"] = {
                    icon = "󰂺",
                    color = "#d5ecf7",
                    name = "index"
                },
                ["ab_radix.md"] = {
                    icon = "",
                },
                ["scratch.md"] = {
                    icon = "󰙏",
                },
                ["vimeverywhere.txt"] = {
                    icon = "",
                },
            }
        })
    end,
}
