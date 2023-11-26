local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.load_extension('aerial')

telescope.setup {
    extensions = {
        aerial = {
            show_nesting = {
                ['_'] = false,
                json = true,
                yaml = true,
                lua = true,
            }
        }
    }
}

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
