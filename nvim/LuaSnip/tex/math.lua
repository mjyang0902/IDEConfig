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
local postfix = require("luasnip.extras.postfix").postfix

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

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
    s({trig = '(%a)(%d)', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>_{<>}]],
            {
                f( function(_, snip) return snip.captures[1] end ),
                f( function(_, snip) return snip.captures[2] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '}(%d)', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[}_{<>}]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '(%a)mab', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[\mathbb{<>}]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '(%d)mab', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[\matopbm{<>}]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),

    s({trig = '(%a)mcl', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[\mathcal{<>}]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),

    s({trig = '(%a)mop', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[\mathop{<>}]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    -- Examples of Greek letter snippets, autotriggered for efficiency
    s({trig = '([^%\\])alpha', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\alpha]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])beta', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\beta]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])gamma', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\gamma]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])eps', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\varepsilon]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])delta', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\delta]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])Delta', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\Delta]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),

    s({trig = '([^%\\])sigma', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\sigma]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])chi', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\chi]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])eta', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\eta]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])iota', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\iota]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])kappa', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\kappa]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])lambda', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\lambda]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])mu', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\mu]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),

    s({trig = '([^%\\])nu', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\nu]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])omega', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\omega]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])phi', regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 100},
        fmta(
            [[<>\phi]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])pi', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\pi]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])psi', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\psi]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])rho', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\rho]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])tau', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\tau]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])theta', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\theta]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])upsilon', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\upsilon]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])xi', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\xi]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])zeta', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\zeta]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])digamma', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\digamma]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])varkappa', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\varkappa]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])varphi', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\varphi]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])varpi', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\varpi]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])varrho', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\varrho]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])varsigma', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\varsigma]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])vartheta', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\vartheta]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])Gamma', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\Gamma]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])Lambda', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\Lambda]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])Omega', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\Omega]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])Phi', regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 100},
        fmta(
            [[<>\Phi]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])Pi', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\Pi]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])Psi', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\Psi]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])Sigma', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\Sigma]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])Theta', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\Theta]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])Upsilon', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\Upsilon]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])Xi', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\Xi]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])aleph', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\aleph]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])beth', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\beth]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])daleth', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\daleth]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])gimel', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\gimel]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])min', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\min]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])max', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\max]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])sup', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\sup]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])inf', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\inf]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])star', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\star]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])inn', regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 100},
        fmta(
            [[<>\in ]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])not in', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\not\in ]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])nin', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\nin ]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])log', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\log]],

            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = 'sr', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        t("^{2}"),
        {
            condition = in_mathzone
        }
    ),
    s({trig = 'cb', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        t("^{3}"),
        {
            condition = in_mathzone
        }
    ),
    s({trig = "td", regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[^{<>}]],
            {
                d(1, get_visual),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = "sq", regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[\sqrt{<>}]],
            {
                d(1, get_visual),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = "tii", dscr = "Expands 'tii' into LaTeX's textit{} command.", snippetType = "autosnippet"},
        fmta("\\textit{<>}",
            {
                d(1, get_visual),
            }
        )
    ),
    s({trig = '([^%\\])text', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\text{<>}]],
            {
                f(function(_, snip) return snip.captures[1] end ),
                d(1, get_visual),
            }
        ),
        {
            condition = in_mathzone
        }
    ),

    --
    -- Yes, these jumbles of text nodes and insert nodes get messy fast, and yes,
    -- there is a much better, human-readable solution: ls.fmt, described shortly.
    s({trig = "([%s])/", regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[\frac{<>}{<>}]],
            {
                d(1, get_visual),
                i(2),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    postfix("/", {l("\\frac{" .. l.POSTFIX_MATCH .. "}{<>}")}, { condition=in_mathzone }),
    s({trig = "suma", regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[\sum\limits_{<>}^{<>} <>]],
            {
                i(1,"i=1"),
                i(2,"n"),
                d(3, get_visual),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = "int", regTrig = true, wordTrig = false},
        fmta(
            [[\int_{<>}^{<>} <>]],
            {
                i(1),
                i(2),
                d(3, get_visual),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = "([%a%}%s])'", regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>^{\prime}]],
            {
                f( function(_, snip) return snip.captures[1] end ),

            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])left', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\left <> \right <>]],
            {
                f( function(_, snip) return snip.captures[1] end ),
                i(1),
                i(0),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])ceil', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\left\lceil <> \right\rceil <>]],
            {
                f( function(_, snip) return snip.captures[1] end ),
                i(1),
                i(0),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])floor', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\left\lfloor <> \right\rfloor <>]],
            {
                f( function(_, snip) return snip.captures[1] end ),
                i(1),
                i(0),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])limit', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>\limits_{<>} <>]],
            {
                f(function(_, snip) return snip.captures[1] end ),
                i(1),
                i(0),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^%\\])lim', regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 100},
        fmta(
            [[<>\lim\limits_{<>} <>]],
            {
                f( function(_, snip) return snip.captures[1] end ),
                i(1),
                i(0),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([/.])([/.])([/.])', regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 100},
        t("\\ldots "),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([/*])([/*])', regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 100},
        t("\\times "),
        {
            condition = in_mathzone
        }
    ),

    s({trig = '->', regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 100},
        t("\\rightarrow "),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '-<', regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 100},
        t("\\leftarrow "),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '=>', regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 100},
        t("\\Rightarrow "),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '=<', regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 100},
        t("\\leftarrow "),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '>=', regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 100},
        t("\\geq "),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '<=', regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 100},
        t("\\leq "),
        {
            condition = in_mathzone
        }
    ),
    s({trig = 'aa', regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 100},
        t("\\forall "),
        {
            condition = in_mathzone
        }
    ),
    s({ trig='lrv', name='left right', dscr='left right'},
        fmt([[\left(<>\right)<>]],
            { f(function(args, snip)
                local res, env = {}, snip.env
                for _, val in ipairs(env.LS_SELECT_RAW) do table.insert(res, val) end
                return res
            end, {}), i(0) },
            { delimiters='<>' }
        ), { condition=in_mathzone, show_condition=in_mathzone}),
    postfix("hat", {l("\\hat{" .. l.POSTFIX_MATCH .. "}")}, { condition=in_mathzone }),
}
