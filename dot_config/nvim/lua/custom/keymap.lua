-- Auto Expand %% to current directory
local function autoExpandCWD()
  if [[getcmdtype() == ':']] then
    return vim.fn.expand '%:h' .. '/'
  end
  return '%%'
end

vim.keymap.set('c', '%%', autoExpandCWD, { expr = true, noremap = true })

vim.keymap.set('n', '<leader>k', '<cmd>Telescope keymaps<CR>', { desc = 'Which [K]ey' })

-- ノーマルモードで <C-s> を保存にマッピング
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })

-- インサートモードで <C-s> を保存にマッピング
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>a', { noremap = true, silent = true })

-- ビジュアルモードで <C-s> を保存にマッピング
vim.api.nvim_set_keymap('v', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true })
