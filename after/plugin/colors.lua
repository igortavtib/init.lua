local tokyonight = require('tokyonight')

tokyonight.setup({
  style = 'night',
  transparent = true,
  styles = {
    sidebars = "transparent",
  }
})

vim.cmd [[colorscheme tokyonight]]
