vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    requires = { { "nvim-lua/plenary.nvim" } },
  })

  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

  use({
    "ThePrimeagen/harpoon",
    requires = { { "nvim-lua/plenary.nvim" } },
  })

  use("mbbill/undotree")

  use({
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    requires = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "L3MON4D3/LuaSnip" },
    },
  })


  use({
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  })

  use "m4xshen/autoclose.nvim"

  use "christoomey/vim-tmux-navigator"

  use({
    "nvim-tree/nvim-tree.lua",
    requires = {
      { "nvim-tree/nvim-web-devicons" }
    }
  })

  use('mfussenegger/nvim-dap')

  use({
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true },
  })

  use({ 'rcarriga/nvim-dap-ui', requires = { "mfussenegger/nvim-dap" } })

  use({ "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end, })


  use({
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "sindrets/diffview.nvim",
      "ibhagwan/fzf-lua",
    },
  })

  use({ "stevearc/aerial.nvim" })

  use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }

  use({ 'github/copilot.vim' })

  use({ 'simrat39/rust-tools.nvim' })

  use({ 'folke/tokyonight.nvim' })
end)
