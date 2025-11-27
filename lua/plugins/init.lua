return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		opts = require("configs.conform"),
	},

	-- These are some examples, uncomment them if you want to see them work!
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},

	-- test new blink
	-- { import = "nvchad.blink.lazyspec" },

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"vim",
				"lua",
				"vimdoc",
				"html",
				"css",
				"javascript",
				"go",
			},
		},
	},
	{
		"nvzone/typr",
		dependencies = "nvzone/volt",
		opts = {},
		cmd = { "Typr", "TyprStats" },
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^6",
		lazy = false,
		ft = { "rust" },
		dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig" },
		config = function()
			require("configs.rust")
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("configs.dap")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			require("dapui").setup()
		end,
	},
	{
		"saecki/crates.nvim",
		ft = { "rust", "toml" },
		config = function()
			require("configs.crates")
		end,
	},
}
