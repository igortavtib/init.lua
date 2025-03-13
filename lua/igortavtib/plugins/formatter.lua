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
       },
       javascriptreact = {
         require("formatter.filetypes.javascript").eslint
       },
       typescriptreact = {
         require("formatter.filetypes.typescript").eslint
       },
       go = {
         require("formatter.filetypes.go").gofumpt
       },
     }
   })

   local augroup = vim.api.nvim_create_augroup
   local autocmd = vim.api.nvim_create_autocmd
   augroup("__formatter__", { clear = true })
   autocmd("BufWritePost", {
     group = "__formatter__",
     command = ":FormatWrite",
   })
  end
}
