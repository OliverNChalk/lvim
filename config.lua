-- General LunarVim
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "onedarker"

-- General NeoVim
vim.opt.relativenumber = true
vim.opt.scrolloff = 7
vim.opt.sidescrolloff = 10
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Languages
-- TypeScript
lvim.lang.typescript.linters = { { exe = "eslint_d" } }
lvim.lang.typescript.formatters = { { exe = "eslint_d" } }

lvim.lang.javascript.linters = lvim.lang.typescript.linters;
lvim.lang.javascript.formatters = lvim.lang.typescript.formatters;
lvim.lang.typescriptreact.linters = lvim.lang.typescript.linters;
lvim.lang.typescriptreact.formatters = lvim.lang.typescript.formatters;
lvim.lang.javascriptreact.linters = lvim.lang.typescript.linters;
lvim.lang.javascriptreact.formatters = lvim.lang.typescript.formatters;

-- JSON
lvim.lang.json.formatters = { { exe = 'prettierd' } }

------
-- Plugins
------
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile

-- Core
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true

lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.nvimtree.hide_dotfiles = 0

lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.highlight.enabled = true

-- lualine_y is nil by default, use it show line and col number
lvim.builtin.lualine.sections.lualine_y = { "location" }

-- Extra
lvim.plugins = {
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  {
    "psliwka/vim-smoothie",
    config = function()
      vim.cmd("let g:smoothie_update_interval = 10")
      vim.cmd("let g:smoothie_speed_linear_factor = 15")
      vim.cmd("let g:smoothie_speed_constant_factor = 15")
    end,
  },
}

------
-- Keybinds
------
-- Bind Y to copy entire line
vim.api.nvim_set_keymap("n", "<S-y>", "yy", { noremap = true, silent = true });

-- Navigate back and forward between buffers
vim.api.nvim_set_keymap("n", "<TAB>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-TAB>", ":bprevious<CR>", { noremap = true, silent = true })

-- Center screen after jump
vim.api.nvim_set_keymap("n", "n", "nzz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", "Nzz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "*", "*zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "#", "#zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "g*", "g*zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "g#", "g#zz", { noremap = true, silent = true })

-- WhichKey
lvim.leader = "space"

-- Replace default toggle highlight with clear search
lvim.builtin.which_key.mappings["h"] = nil
lvim.builtin.which_key.mappings["n"] = { ":let @/=''<CR>", "Clear Search" }
