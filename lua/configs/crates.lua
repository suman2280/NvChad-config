require("crates").setup({
	lsp = {
		enabled = true,
		on_attach = function() end,
		actions = true,
		completion = true,
		hover = true,
	},
	completion = {
		crates = {
			enabled = true,
		},
	},
})
