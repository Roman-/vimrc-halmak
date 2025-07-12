set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source /home/lo/cloud/coding/configs/vim/rog_halmak/vimrc.vim

let g:firenvim_config = {
    \ 'globalSettings': {
    \     '<C-1>': 'default',
    \     '<C-9>': 'default',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'takeover': 'never',
        \ },
    \ }
\ }


lua << EOF
-- setup LSP config
-- require("grammar-guard").init()
-- 
-- require("lspconfig").grammar_guard.setup({
--   cmd = { '/path/to/ltex-ls' }, -- add this if you install ltex-ls yourself
-- 	settings = {
-- 		ltex = {
-- 			enabled = { "latex", "tex", "bib", "markdown" },
-- 			language = "en",
-- 			diagnosticSeverity = "information",
-- 			setenceCacheSize = 2000,
-- 			additionalRules = {
-- 				enablePickyRules = true,
-- 				motherTongue = "en",
-- 			},
-- 			trace = { server = "verbose" },
-- 			dictionary = {},
-- 			disabledRules = {},
-- 			hiddenFalsePositives = {},
-- 		},
-- 	},
-- })
EOF
