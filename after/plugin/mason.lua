local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

mason.setup({
    ensure_installed = { 'js-debug-adapter', 'prettier', 'eslint-lsp' }
})
mason_lspconfig.setup {
    ensure_installed = { 'lua_ls', 'rust_analyzer', 'tsserver', 'html' },
}
