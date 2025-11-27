-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

--Old: ---@type ChadrcConfig
---@class CustomChadrcConfig: ChadrcConfig
local M = {}
local fn = vim.fn
local sep_l = ""

M.base46 = {
	theme = "catppuccin",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

-- M.nvdash = { load_on_startup = true }
M.ui = {
	statusline = {
		modules = {
			cursor = function()
				local line = fn.line(".")
				local col = fn.virtcol(".")
				local chad = string.format(" %d:%d", line, col) .. " │ "

				-- default cursor_position module
				local left_sep = "%#St_pos_sep#" .. sep_l .. "%#St_pos_icon#" .. " "

				local current_line = fn.line(".")
				local total_line = fn.line("$")
				local text = math.modf((current_line / total_line) * 100) .. tostring("%%")
				text = string.format("%4s", text)

				text = (current_line == 1 and "Top") or text
				text = (current_line == total_line and "Bot") or text

				return left_sep .. "%#St_pos_text#" .. chad .. text .. " "
			end,
		},
	},
}

M.lsp = { signature = true }

-- Install packages with mason
M.mason = {
	pkgs = { "rust-analyzer", "codelldb", "goimports-reviser", "gofumpt", "delve" },
}

M.setup = function()
	require("configs.rust-setup")
end

return M
