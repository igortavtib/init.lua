return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        highlight = { enable = true },
        ident = { enable = true },
			  ensure_installed = {
				  "lua",
				  "luadoc",
				  "luap",
				  "vim",
				  "vimdoc",
				  "rust",
          "go",
          "templ",
          "tsx",
          "proto"
			  }
      })
    end
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = { mode = "cursor", max_lines = 3 },
	}
}
