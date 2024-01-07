return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		opts = {
			highlight = { enable = true },
			indent  = { enable = true },
			ensure_installed = {
				"lua",
				"luadoc",
				"luap",
				"vim",
				"vimdoc",
				"rust"
			}
		}
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = { mode = "cursor", max_lines = 3 },
	}
}
