return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "main",
        dark_variant = "main",
        extend_background_behind_borders = false,

        styles = {
          transparency = true,
        }
      })

      vim.cmd("colorscheme rose-pine")
    end
  }
}
