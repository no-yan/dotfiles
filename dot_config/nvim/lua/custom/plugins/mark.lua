return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    -- Add edited files to harpoon list
    vim.api.nvim_create_autocmd('InsertLeave', {
      pattern = '*',
      callback = function()
        local filetype = vim.bo.filetype
        local filename = vim.fn.expand '%:p'
        local excluded_filetypes = {
          'harpoon',
          'netrw',
          'nerdtree',
          'NvimTree',
          'neo-tree',
          'fugitive',
          'help',
          '',
        }
        -- Ignore specified file types
        for _, ft in ipairs(excluded_filetypes) do
          if filetype == ft then
            return -- No op
          end
        end
        -- 特定のファイル名パターンを除外
        if filename:match '__harpoon%-menu__' then
          return -- 特定のパターンに一致したら追加しない
        end
        harpoon:list():add()
      end,
    })

    -- Open last modified window
    local function select_last()
      harpoon:list():select(harpoon:list():length())
    end

    -- Key maps
    vim.keymap.set('n', '<leader>ma', function()
      harpoon:list():add()
    end, { desc = '[M]ark [A]dd harpoon list' })
    vim.keymap.set('n', '<leader>mp', function()
      select_last()
    end, { desc = 'Open Last Midified Buffer' })
    vim.keymap.set('n', '<C-1>', function()
      harpoon:list():select(1)
    end, { desc = 'Select 1st harpoon list' })
    -- vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
    -- なぜか<C-2>がビジュアルモードでブロックを選択しているのでオフにした
    vim.keymap.set('n', '<C-3>', function()
      harpoon:list():select(3)
    end, { desc = 'Select 3rd harpoon list' })
    vim.keymap.set('n', '<C-4>', function()
      harpoon:list():select(4)
    end, { desc = 'select 4th harpoon list' })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<C-S-P>', function()
      harpoon:list():prev()
    end, { desc = 'Select [P]revious harpoon list' })
    vim.keymap.set('n', '<C-S-N>', function()
      harpoon:list():next()
    end, { desc = 'Select [N]ext harpoon list' })

    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Toggle mark list menu.' })
    -- vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
    --     { desc = "Open harpoon window" })
  end,
}
