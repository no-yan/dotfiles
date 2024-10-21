-- Set the errorformat for Go build output
vim.cmd [[setlocal errorformat=%f:%l:%c:\ %m]]

-- Define a function to run a command and populate the location list with its output
function RunCommandInLocationList(cmd)
  local handle = io.popen(cmd .. ' 2>&1')
  if not handle then
    print 'Failed to run command'
    return
  end

  local result = handle:read '*a'
  handle:close()

  if result == '' then
    print 'No output from command'
    return
  end

  local lines = vim.split(result, '\n')

  vim.fn.setloclist(0, {}, ' ', {
    title = cmd,
    lines = lines,
  })

  if not vim.tbl_isempty(lines) then
    vim.cmd 'lopen'
  end
end

vim.api.nvim_create_user_command('LL', function(opts)
  RunCommandInLocationList(opts.args)
end, { nargs = 1 })

-- vim.api.nvim_set_keymap('n', '<leader>gb', [[:lua RunCommandInLocationList('go build ./...')<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>gl', [[:lua RunCommandInLocationList('golangci-lint run')<CR>]], { noremap = true, silent = true })

-- Optionally, automatically run go build on file save
-- vim.api.nvim_create_autocmd('BufWritePost', {
--   pattern = '*.go',
--   callback = function()
--     RunCommandInLocationList 'go build ./...'
--   end,
-- })
