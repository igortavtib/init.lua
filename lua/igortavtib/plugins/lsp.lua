return {
	{
		"neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
		dependencies = {
       "hrsh7th/cmp-nvim-lsp",
       "hrsh7th/nvim-cmp",
      { "antosha417/nvim-lsp-file-operations", config = true },
		},
    config = function()
      local lspconfig = require("lspconfig")

      local lsputil = require("lspconfig/util")

      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local opts = { noremap = true, silent = true }

      local on_attach = function(client, bufnr)
        opts.buffer = bufnr

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":Lsprestart<CR>", opts)
      end

      local capabilities = cmp_nvim_lsp.default_capabilities()

      vim.filetype.add({ extension = { templ = "templ" } })

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              }
            }
          }
        }
      })

      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "rust" },
        root_dir = lsputil.root_pattern("Cargo.toml"),
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            }
          }
        }
      });

      lspconfig.tsserver.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        init_options = {
          preferences = {
            disableSuggestions = true,
          }
        }
      })

      lspconfig.gopls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      lspconfig.templ.setup({
        on_attach = on_attach,
        capabilities = capabilities
      })

      lspconfig.html.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "html", "templ" },
      })

      lspconfig.htmx.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "html", "templ" }
      })
    end
	},
	{
		"williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      local mason = require("mason")

      local mason_lspconfig = require("mason-lspconfig")

      local mason_tool_installer = require("mason-tool-installer")

      mason.setup({})

      mason_lspconfig.setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "tsserver",
          "gopls",
          "templ",
          "html",
          "htmx",
        },

        automatic_installation = true,
      })

      mason_tool_installer.setup({
        ensure_installed = {
          "eslint",
        }
      })
    end
	}
}
