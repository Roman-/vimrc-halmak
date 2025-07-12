if vim.fn.expand("%:t") == "index.md" then vim.cmd('colorscheme sonokai') else vim.cmd('colorscheme github_dark') end

-- transparent background
vim.cmd('hi Normal guibg=none')
vim.cmd('hi NonText guibg=none')
vim.cmd('hi EndOfBuffer guibg=none')
-- vim.cmd([[syntax match CustomLinkPattern "http[s]\?:\/\/[^\s ]\+"]]) -- doesn't work in init.lua, but works manually
-- vim.cmd([[syntax match TODO /\<TODO\>/]])
vim.cmd([[highlight link CustomLinkPattern markdownUrl]])
