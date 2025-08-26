return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>ff', function()
      builtin.find_files({ hidden = true })
    end, { desc = 'Find files with dotfiles' })

    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>ge', function()
      builtin.live_grep({
        prompt_title = ".env files",
        find_command = { "rg", "--files", "--hidden", "--no-ignore", "-g", ".env*" }
      })
    end, { desc = "Find .env* files" })

    vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope git files' })

    vim.keymap.set('n', '<leader>fe', function()
      builtin.find_files({
        prompt_title = ".env files",
        find_command = { "rg", "--files", "--hidden", "--no-ignore", "-g", ".env*" }
      })
    end, { desc = "Find .env* files" })
  end,
}
