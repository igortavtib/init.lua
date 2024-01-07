return {
  "mhartington/formatter.nvim",
  event = "VeryLazy",
  config = function ()
   require("formatter").setup({
     filetype = {
       javascript = {
         require("formatter.filetypes.javascript").eslint
       },
       typescript = {
         require("formatter.filetypes.typescript").eslint
       }
     }
   })
  end
}
