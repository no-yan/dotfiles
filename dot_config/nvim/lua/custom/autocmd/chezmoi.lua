vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { os.getenv 'HOME' .. '/.local/share/chezmoi/*' },
  callback = function(ev)
    local bufnr = ev.buf
    local edit_watch = function()
      require('chezmoi.commands.__edit').watch(bufnr)
    end
    vim.schedule(edit_watch)
  end,
})

-- telscope-config.lua
local telescope = require 'telescope'

telescope.setup {
  -- ... your telescope config
}

telescope.load_extension 'chezmoi'
vim.keymap.set('n', '<leader>cz', telescope.extensions.chezmoi.find_files, {})
-- You can also search a specific target directory and override arguments
-- Here is an example with the default args
vim.keymap.set('n', '<leader>fc', function()
  telescope.extensions.chezmoi.find_files {
    targets = vim.fn.stdpath 'config',
    args = {
      '--path-style',
      'absolute',
      '--include',
      'files',
      '--exclude',
      'externals',
    },
  }
end, {})
