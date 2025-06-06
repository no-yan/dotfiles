return {
  {
    'ray-x/go.nvim',
    dependencies = { 'ray-x/guihua.lua' },
    ft = { 'go', 'gomod', 'gotmpl' },
    build = ':lua require("go.install").update_all_sync()',
    config = function()
      require('go').setup {}
    end,
  },
}
