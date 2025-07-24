return {
    "kyazdani42/nvim-web-devicons",
    config = function()
        local devicons = require("nvim-web-devicons")

        devicons.setup({
            override_by_filename = {
                ["index.md"] = { icon = "󰂺", },
                ["ab_radix.md"] = { icon = "", },
                ["scratch.md"] = { icon = "󰙏", },
                ["vimeverywhere.txt"] = { icon = "", },
                ["mystery_box.md"] = { icon = "󱓕", },
            },
        })
    end,
}
