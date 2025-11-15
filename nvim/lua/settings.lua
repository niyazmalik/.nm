
-- Fix popup menu colors
vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#0b1542', fg = '#ffffff' })
vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#414157', fg = '#ffffff' })
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = '#2a2a2a' })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = '#4a4a4a' })

-- UI settings
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.laststatus = 0
vim.opt.signcolumn = "no"
vim.opt.scrolloff = 0
vim.opt.fillchars = { eob = " " }

-- Disable bracket matching highlight
vim.g.loaded_matchparen = 1

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Left margin padding
vim.opt.foldcolumn = "4"
vim.cmd([[highlight FoldColumn guibg=NONE ctermbg=NONE]])

-- Hide mode text and messages
vim.opt.showmode = false
vim.opt.shortmess:append("IWc")

-- Indentation
vim.opt.tabstop = 6
vim.opt.shiftwidth = 6
vim.opt.expandtab = true
vim.opt.autoindent = true
