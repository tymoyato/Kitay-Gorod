return {
  -- Completion Stuff
  {
    "hrsh7th/nvim-cmp",
    opts = require("configs.cmp").sources,
  },
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup {}
    end,
    lazy = false,
  },
  -- Formatting Stuff
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  -- Lsp Stuff
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  -- {
  --     "nvimtools/none-ls.nvim",
  --     lazy = false,
  --     config = function()
  --       require "configs.null-ls"
  --     end
  -- },
  -- Binary Stuff
  {
    "williamboman/mason.nvim",
    opts = require("configs.mason").ensure_installed,
  },
  -- Treesitter Stuff
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require("configs.treesitter").ensure_installed,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  -- Ruby & Rails stuff
  { "tpope/vim-rails", ft = "ruby", lazy = false },
  { "vim-ruby/vim-ruby", ft = "ruby", lazy = false },
  { "RRethy/nvim-treesitter-endwise", ft = "ruby", lazy = false },
  { "tree-sitter/tree-sitter-embedded-template", ft = "embedded_template", lazy = false },
  -- Git stuff
  { "tpope/vim-fugitive", lazy = false },
  { "sindrets/diffview.nvim", lazy = false },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>gl", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true,
    keys = {
      { "<leader>gn", "<cmd>Neogit<cr>", desc = "NeoGit" },
    },
  },
  -- Editting
  { "mg979/vim-visual-multi", lazy = false },
  { "tpope/vim-surround", lazy = false },
  { "HiPhish/rainbow-delimiters.nvim", ft = "ruby", lazy = false },
  {
    "NvChad/nvim-colorizer.lua",
    enabled = true,
  },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  {
    "tpope/vim-dadbod",
    lazy = false,
    ft = "sql",
    dependencies = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
      lazy = false,
    },
  },
  -- DAP stuff
  {
    "mfussenegger/nvim-dap",
    lazy = false,
    dependencies = {
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
      "leoluz/nvim-dap-go",
      "suketa/nvim-dap-ruby",
      "theHamsta/nvim-dap-virtual-text",
      lazy = false,
    },
    config = function()
      require "configs.nvim-dap"
    end,
  },
}
