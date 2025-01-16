local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local autosnippet = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

local get_visual = function(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else  -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

local in_mathzone = function()
    -- The `in_mathzone` function requires the VimTeX plugin
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
-- brackets
local brackets = {
	a = { "\\langle", "\\rangle" },
	A = { "Angle", "Angle" },
	b = { "[", "]" },
	B = { "\\{", "\\}" },
	c = { "brace", "brace" },
	m = { "|", "|" },
	p = { "(", ")" },
}

return {
    s({trig = "mk", dscr = "Math environment.", snippetType = "autosnippet"},
        fmta([[$<>$<>]],
            {
                d(1, get_visual),
                i(2),
            }
        )
    ),
    autosnippet(
	{ trig = "lr([aAbBcmp])", name = "left right", dscr = "left right delimiters", regTrig = true, hidden = true },
	fmta(
	[[
    \left<> <> \right<><>
    ]],
	{f(function(_, snip)
        cap = snip.captures[1] or 'p'
        return brackets[cap][1]
    end),
    d(1, get_visual),
    f(function(_, snip)
        cap = snip.captures[1] or 'p'
        return brackets[cap][2]
    end),
    i(0)}),
    { condition = in_mathzone, show_condition = in_mathzone}),
}
