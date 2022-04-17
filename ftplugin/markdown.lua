local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    exe = "prettier",
    filetypes = { "markdown" },
  },
}

vim.cmd[[setlocal shiftwidth=2]]
vim.cmd[[setlocal tabstop=2]]
vim.cmd[[setlocal textwidth=80]]
-- vim.list_extend(lvim.lsp.override, { "ltex", "tailwindcss" })
