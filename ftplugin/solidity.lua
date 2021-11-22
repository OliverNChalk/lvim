local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup({{exe = "prettier", filetypes = {"solidity"} }})

vim.cmd[[setlocal shiftwidth=4]]
vim.cmd[[setlocal tabstop=4]]
