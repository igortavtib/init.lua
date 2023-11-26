local aerial = require('aerial')

aerial.setup {
    on_attach = function(bufnr)
        vim.keymap.set("n", "<C-p>", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "<C-n>", "<cmd>AerialNext<CR>", { buffer = bufnr })
    end,
    layout = {
        max_idth = { 60, 0.4 },
        min_width = 50
    },
    keymaps = {
        ["<C-p>"] = 'actions.prev',
        ["<C-n>"] = 'actions.next'
    }
}

vim.keymap.set('n', '<leader>at', '<cmd>AerialToggle<CR>')
