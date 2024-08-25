-- https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim-imports
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { 'source.organizeImports' } }
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
    -- machine and codebase, you may want longer. Add an additional
    -- argument after params if you find that you have to write the file
    -- twice for changes to be saved.
    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or 'utf-16'
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format { async = false }
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*.go',
  callback = function()
    local filename = vim.fn.expand '<afile>'

    local makefile_exists = vim.fn.filereadable 'Makefile' == 1
    if makefile_exists then
      return
    end

    if not filename:match '_test%.go$' then
      vim.cmd 'compiler! go'
    else
      vim.opt_local.makeprg = 'go test'
    end
  end,
})

-- vim.api.nvim_create_autocmd('BufEnter', {
--   pattern = '*_test.go',
--   callback = function()
--     local efm = table.concat({
--       ',%G--- FAIL: %%(Example%)%@=%m (%.%#)',
--       '%-G# %.%#', -- Ignore lines starting with '# '
--       '%A%f:%l:%c: %m', -- Match file:line:column: message
--       '%A%f:%l: %m', -- Match file:line: message
--       '%C%*\\s%m', -- Match continuation lines with leading whitespace
--       '%-G%.%#', -- Ignore any other lines
--     }, ',')
--
--     vim.bo.errorformat = efm
--   end,
-- })
--
-- vim.api.nvim_create_autocmd('BufEnter', {
--   pattern = '*_test.go',
--   callback = function()
--     local goroot = vim.fn.system('go env GOROOT'):gsub('%s+', '')
--     local show_name = true -- 必要に応じて設定
--
--     local indent = '%\\%(    %\\)'
--     local format = table.concat({
--       '%-G=== RUN   %.%#',
--       '%-G' .. indent .. '%#--- PASS: %.%#',
--       '%G--- FAIL: Example%\\@=%m (%.%#)',
--     }, ',')
--
--     if show_name then
--       format = format .. ',%G' .. indent .. '%#--- FAIL: %m (%.%#)'
--     else
--       format = format .. ',%-G' .. indent .. '%#--- FAIL: %.%#'
--     end
--
--     format = table.concat({
--       format,
--       '%A' .. indent .. '%#%\\t%\\+%f:%l: %m',
--       '%A' .. indent .. '%#%\\t%\\+%f:%l: ',
--       '%G' .. indent .. '%#%\\t%\\{2}%m',
--       '%A' .. indent .. '%\\+%[%^:]%\\+: %f:%l: %m',
--       '%A' .. indent .. '%\\+%[%^:]%\\+: %f:%l: ',
--       '%A' .. indent .. '%\\+%f:%l: %m',
--       '%A' .. indent .. '%\\+%f:%l: ',
--       '%G' .. indent .. '%  %m',
--       '%+Gpanic: test timed out after %.%\\+',
--       '%+Grunning tests:',
--       '%+Afatal error: %.%# [recovered]',
--       '%+Apanic: %.%# [recovered]',
--       '%+Afatal error: %.%#',
--       '%+Apanic: %.%#',
--       '%-Cgoroutine %d%+ [running]:',
--       '%-C' .. goroot .. '%f%+:%d%+ +0x[0-9A-Fa-f]%+',
--       '%Z%\\t%f:%l +0x[0-9A-Fa-f]%+',
--       '%-Gruntime.goparkunlock(%.%#',
--       '%-G%\\t' .. goroot .. '%f%+:%d%+',
--       '%-G%\\t%f:%l +0x[0-9A-Fa-f]%+',
--       '%-Cexit status %[0-9]%+',
--       '%-CFAIL%\\t%.%#',
--       '%A%f:%l:%c: %m',
--       '%A%f:%l: %m',
--       '%-C%\\tpanic: %.%#',
--       '%G%\\t%m',
--       '%-C%.%#',
--       '%-G%.%#',
--     }, ',')
--
--     vim.bo.errorformat = format
--   end,
-- })
