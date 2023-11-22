local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
	lsp_zero.buffer_autoformat()
end)

lsp_zero.setup()

local lsp_config = require("lspconfig")

lsp_config.lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT"
			}
		},
		diagnostics = {
			globals = {
				'vim',
				'reuire'
			}
		},
		workspace = {
			library = vim.api.nvim_get_runtime_file("", true)
		},
		telemetry = {
			enable = false,
		}
	}
})

lsp_config.tsserver.setup({
	settings = {
		completions = {
			completeFunctionCalls = true,
		}
	}
})

lsp_config.eslint.setup({})

lsp_config.rust_analyzer.setup({
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
			},
		},
	},
})
