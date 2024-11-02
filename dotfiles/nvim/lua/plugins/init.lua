return {
  --# nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    opts = require("configs.cmp").sources,
  },
  --# codeium.nvim
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
  --# conform.nvim
  {
    "stevearc/conform.nvim",
    lazy = true,
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  --# nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  --# none-ls.nvim
  -- {
  --   "nvimtools/none-ls.nvim",
  --   lazy = false,
  --   config = function()
  --     require "configs.null-ls"
  --   end,
  -- },
  --# mason.nvim
  {
    "williamboman/mason.nvim",
    opts = require("configs.mason").ensure_installed,
  },
  --# nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require("configs.treesitter").ensure_installed,
  },
  --# markdown-preview.nvim
  {
    "iamcco/markdown-preview.nvim",
    lazy = true,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  --# vim-rails
  { "tpope/vim-rails", ft = "ruby", lazy = false },
  --# vim-ruby
  { "vim-ruby/vim-ruby", ft = "ruby", lazy = false },
  --# nvim-treesitter-endwise
  { "RRethy/nvim-treesitter-endwise", ft = "ruby", lazy = false },
  --# tree-sitter-embedded-template
  { "tree-sitter/tree-sitter-embedded-template", ft = "embedded_template", lazy = false },
  --# vim-fugitive
  { "tpope/vim-fugitive", lazy = false },
  --# diffview
  { "sindrets/diffview.nvim", lazy = true },
  --# lazygit.nvim
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
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
  --# neogit
  {
    "NeogitOrg/neogit",
    lazy = true,
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
  --# vim-visual-multi
  { "mg979/vim-visual-multi", lazy = false },
  --# vim-surround
  { "tpope/vim-surround", lazy = false },
  --# rainbow-delimiters.nvim
  { "HiPhish/rainbow-delimiters.nvim", ft = "ruby", lazy = false },
  --# nvim-colorizer.lua
  {
    "NvChad/nvim-colorizer.lua",
    enabled = true,
  },
  --# nvim-treesitter-textobjects
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  --# vim-dadbod
  {
    "tpope/vim-dadbod",
    lazy = true,
    ft = "sql",
    dependencies = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
      -- lazy = false,
    },
  },
  --# nvim-dap
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
      "leoluz/nvim-dap-go",
      "suketa/nvim-dap-ruby",
      "theHamsta/nvim-dap-virtual-text",
      -- lazy = false,
    },
    config = function()
      require "configs.nvim-dap"
    end,
  },
  --# flash.nvim
  {
    "folke/flash.nvim",
    lazy = true,
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
  -- stylua: ignore
    keys = {
      { "<leader>ss", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "<leader>sS", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "<leader>sd", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "<leader>sD", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<leader>s<leader>",mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  --# auto-session
  {
    "rmagatti/auto-session",
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      -- log_level = 'debug',
    },
  },
  --# goto-preview
  {
    "rmagatti/goto-preview",
    event = "BufEnter",
    config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
    keys = {
      {
        "<leader>gpd",
        function()
          require("goto-preview").goto_preview_definition()
        end,
        desc = "goto_preview_definition",
      },
      {
        "<leader>gpt",
        function()
          require("goto-preview").goto_preview_type_definition()
        end,
        desc = "goto_preview_type_definition",
      },
      {
        "<leader>gpi",
        function()
          require("goto-preview").goto_preview_implementation()
        end,
        desc = "goto_preview_implementation",
      },
      {
        "<leader>gpD",
        function()
          require("goto-preview").goto_preview_declaration()
        end,
        desc = "goto_preview_declaration",
      },
      {
        "<leader>gpp",
        function()
          require("goto-preview").close_all_win()
        end,
        desc = "close_all_win",
      },
      {
        "<leader>gpr",
        function()
          require("goto-preview").goto_preview_references()
        end,
        desc = "goto_preview_references",
      },
    },
  },
  --# hardtime.nvim
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {},
  },
  --# diffview.nvim
  { "sindrets/diffview.nvim", lazy = "true" },
  --# neotest
  {
    "nvim-neotest/neotest",
    lazy = "false",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  --# rest.nvim
  -- {
  --   "rest-nvim/rest.nvim",
  -- },
}
