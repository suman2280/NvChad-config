local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	-- The snippet function
	s({ trig = "ee", name = "if err != nil" }, {
		t({ "if err != nil {", "\t" }),
		i(0), -- $0: The final tabstop for the cursor
		t({ "", "}" }),
	}),
}
