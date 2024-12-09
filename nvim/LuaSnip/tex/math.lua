local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local fmta = require("luasnip.extras.fmt").fmta
local postfix = require("luasnip.extras.postfix").postfix
local extras = require("luasnip.extras")
local l = extras.lambda

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

-- local HatSequence = [\overline, \bar, \hat, \tilde, \widetilde, \widehat]
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
    s({trig = '(%a)ii', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>_{i}]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '(%a)jj', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>_{j}]],
            {
                f( function(_, snip) return snip.captures[1] end ),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '(%a)tt', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>_{t}]],
            {
                f( function(_, snip) return snip.captures[1] end ),
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
            [[\mathbbm{<>}]],
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
    s({trig = '([^%\\])eta', regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 100},
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
    -- s({trig = '([^%\\])xi', regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 100},
    --     fmta(
    --         [[<>\xi]],
    --         {
    --             f( function(_, snip) return snip.captures[1] end ),
    --         }
    --     ),
    --     {
    --         condition = in_mathzone
    --     }
    -- ),
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
    s({trig = "sb", regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[_{<>}]],
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
    s({trig = "//", regTrig = true, wordTrig = false, snippetType = "autosnippet"},
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
    postfix({trig = "/", snippetType = "autosnippet"},{l("\\frac{" .. l.POSTFIX_MATCH .. "}"),t("{"),i(1),t("}")}, { condition=in_mathzone }),
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
        fmta(
            [[<>]],
            {
                c(1, {t("\\rightarrow"), t("\\longrightarrow"), t("\\Rightarrow"), t("\\Longrightarrow")}),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '-<', regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 100},
        fmta(
            [[<>]],
            {
                c(1, {t("\\leftarrow"), t("\\longleftarrow"), t("\\Leftarrow"), t("\\Longleftarrow")}),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '=>', regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 100},
        fmta(
            [[<>]],
            {
                c(1, {t("\\Rightarrow"), t("\\Longrightarrow"), t("\\rightarrow"), t("\\longrightarrow")}),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '=<', regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 100},
        fmta(
            [[<>]],
            {
                c(1, {t("\\Leftarrow"), t("\\Longleftarrow"), t("\\leftarrow"), t("\\longleftarrow")}),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([^d])iff', regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 100},
        fmta(
            [[<><>]],
            {
                f(function(_, snip) return snip.captures[1] end),
                c(1, {t("\\Leftrightarrow"), t("\\Longleftrightarrow"), t("\\leftrightarrow"), t("\\longleftrightarrow"), t("\\iff")}),
            }
        ),
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
    s({trig = '<=', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        t("\\leq "),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '>~', regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 100},
        t("\\gtrsim "),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '<~', regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 100},
        t("\\lesssim "),
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
    s({trig = 'ee', regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 100},
        t("\\exists "),
        {
            condition = in_mathzone
        }
    ),
    s({trig = 'cc', regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 100},
        t("\\subset"),
        {
            condition = in_mathzone
        }
    ),
    s({ trig='lrv', name='left right', dscr='left right', snippetType = "autosnippet"},
        fmt([[\left(<>\right)<>]],
            { f(function(args, snip)
                local res, env = {}, snip.env
                for _, val in ipairs(env.LS_SELECT_RAW) do table.insert(res, val) end
                return res
            end, {}), i(0) },
            { delimiters='<>' }
        ), { condition=in_mathzone, show_condition=in_mathzone}),
    s({trig = "([%s])lp", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 100},
        fmta(
            [[\|<>\|_{L^{<>}}]],
            {
                d(1, get_visual),
                i(2, "p"),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = "var", regTrig = true, wordTrig = false},
        fmta(
            [[\text{Var}\left(<>\right)]],
            {
                d(1, get_visual),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = "lan", regTrig = true, wordTrig = false},
        fmta(
            [[\langle <>\rangle]],
            {
                d(1, get_visual),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([%a])bar', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>{<>}]],
            {
                c(1, {t("\\bar"), t("\\overline"), t("\\hat"), t("\\tilde"), t("\\widetilde"), t("\\widehat")}),
                f(function(_, snip) return snip.captures[1] end),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([%a])overline', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>{<>}]],
            {
                c(1, {t("\\overline"), t("\\bar"), t("\\hat"), t("\\tilde"), t("\\widetilde"), t("\\widehat")}),
                f(function(_, snip) return snip.captures[1] end),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([%a])hat', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>{<>}]],
            {
                c(1, {t("\\hat"), t("\\widehat"), t("\\tilde"), t("\\widetilde"), t("\\bar"), t("\\overline")}),
                f(function(_, snip) return snip.captures[1] end),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = '([%a])tilde', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
        fmta(
            [[<>{<>}]],
            {
                c(1, {t("\\tilde"), t("\\widetilde"), t("\\hat"), t("\\widehat"), t("\\bar"), t("\\overline")}),
                f(function(_, snip) return snip.captures[1] end),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = 'diff', regTrig = true, wordTrig = false},
        fmta(
            [[\frac{\mathrm{d} <>}{\mathrm{d} <>}]],
            {
                i(1, "y"),
                i(2, "x"),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
    s({trig = 'part', regTrig = true, wordTrig = false},
        fmta(
            [[\frac{\partial <>}{\partial <>}]],
            {
                i(1, "y"),
                i(2, "x"),
            }
        ),
        {
            condition = in_mathzone
        }
    ),
}
