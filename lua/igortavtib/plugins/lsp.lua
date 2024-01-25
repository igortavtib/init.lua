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
        client.server_capabilities.document_formatting = true
        opts.buffer = bufnr

        opts.desc = "Restart LSP"
        -- keymap.set("n", "<leader>rs", ":Lsprestart<CR>", opts)
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

      lspconfig.eslint.setup({
        on_attach = on_attach,
        capabilities = capabilities
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

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function (ev)
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          local opts = { buffer = ev.buf }

          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end
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
