return {
  --     "nvim-neo-tree/neo-tree.nvim",
  --     version = "*",
  --     dependencies = {
  --         "nvim-lua/plenary.nvim",
  --         "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  --         "MunifTanjim/nui.nvim",
  --     },
  --     config = function()
  --         require('neo-tree').setup {
  --             close_if_last_window = true,
  --         }
  --         vim.keymap.set('n', '<leader>-', function()
  --                 local reveal_file = vim.fn.expand('%:p')
  --                 if (reveal_file == '') then
  --                     reveal_file = vim.fn.getcwd()
  --                 else
  --                     local f = io.open(reveal_file, "r")
  --                     if (f) then
  --                         f.close(f)
  --                     else
  --                         reveal_file = vim.fn.getcwd()
  --                     end
  --                 end
  --                 require('neo-tree.command').execute({
  --                     action = "focus",          -- OPTIONAL, this is the default value
  --                     source = "filesystem",     -- OPTIONAL, this is the default value
  --                     position = "left",         -- OPTIONAL, this is the default value
  --                     reveal_file = reveal_file, -- path to file or folder to reveal
  --                     reveal_force_cwd = true,   -- change cwd without asking if needed
  --                     toggle = true,
  --                 })
  --             end,
  --             { desc = "Open neo-tree at current file or working directory" }
  --         );
  --     end,
}
