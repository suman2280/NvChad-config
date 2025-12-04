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
				"c",
				"cpp",
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
	{
		"olexsmir/gopher.nvim",
		ft = "go",
		opts = {},
		config = function()
			require("gopher").setup()
		end,
	},
	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("dap-go").setup()
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		config = function()
			-- This loads all .lua files in the specified path
			require("luasnip.loaders.from_lua").load({
				paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
			})
		end,
	},
}
