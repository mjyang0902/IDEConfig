local ls = require("luasnip") local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
    s({trig="def", dscr = "Code snippet for function definition."},
        fmta(
            [[
                def <>(<>):
                    <>
            ]],
            {
                i(1, "name"),
                i(2, "arg"),
                i(3, "pass"),
            }
        ),
        {condition = line_begin}
    ),
    s({trig="class", dscr = "Code snippet for a class definition."},
        fmta(
            [[
                class <>(<>): 
                    <>
            ]],
            {
                i(1, "Classname"),
                i(2, "object"),
                i(3, "pass"),
            }
        ),
        {condition = line_begin}
    ),
    s({ trig = "if", dscr = "Code snippet for the if statement." }, {
        t"if ", i(1, "condition"), t({":", "\t"}), i(2, "pass")
    }),
    s({ trig = "if/else", dscr = "Code snippet for an if statement with else" }, {
        t"if ", i(1, "condition"), t({":", "\t"}), i(2, "pass"),
        t({"", "else:", "\t"}), i(3, "pass")
    }),
    s({ trig = "elif", dscr = "Code snippet for an elif" }, {
        t"elif ", i(1, "expression"), t({":", "\t"}), i(2, "pass")
    }),
    s({ trig = "else", dscr = "Code snippet for an else" }, {
        t({"else:","\t"}), i(1, "pass")
    }),
    s({ trig = "for", dscr = "Code snippet to create a for loop structure." }, {
        t"for ", i(1, "value"), t" in ", i(2, "iterable"), t({":", "\t"}), i(3, "pass")
    }),
    s({ trig = "for/else", dscr = "Code snippet for a for loop with else" }, {
        t"for ", i(1, "target_list"), t" in ", i(2, "expression_list"), t({":", "\t"}),
        i(3, "pass"), t({"", "else:", "\t"}), i(4, "pass")
    }),
    s({ trig = "while", dscr = "Code snippet to create a while loop structure." }, {
        t"while ", i(1, "condition"), t({":", "\t"}), i(2, "pass")
    }),
    s({ trig = "while/else", dscr = "Code snippet for a while loop with else" }, {
        t"while ", i(1, "expression"), t({":", "\t"}), i(2, "pass"),
        t({"", "else:", "\t"}), i(3, "pass")
    }),

    parse({ trig = "try", dscr = "Code Snippet for a try and except blocks." },
        "try:\n\t${1:pass}\nexcept ${2:Exception} as ${3:e}:\n\t${4:raise $3}$0"),

    parse({ trig = "tryef", dscr = "Code Snippet for a try/except/finally with else statement." },
        "try:\n\t${1:pass}\nexcept${2: ${3:Exception} as ${4:e}}:\n\t${5:raise}\nelse:\n\t${6:pass}\nfinally:\n\t${7:pass}$0"),

    parse({ trig = "trye", dscr = "Code Snippet for a try/except with else statement." },
        "try:\n\t${1:pass}\nexcept ${2:Exception} as ${3:e}:\n\t${4:raise $3}\nelse:\n\t${5:pass}$0"),

    parse({ trig = "tryf", dscr = "Code Snippet for a try/except/finally." },
        "try:\n\t${1:pass}\nexcept ${2:Exception} as ${3:e}:\n\t${4:raise $3}\nfinally:\n\t${5:pass}$0"),

    parse({ trig = "with", dscr = "Code snippet for a with statement" },
        "with ${1:expression} as ${2:target}:\n\t${3:pass}"),

    parse({ trig = "s", dscr = "Shortend snippet to reference the self property in an object." },
        "self.$0"),

    parse({ trig = "ifmain", dscr = "Create implicitly all the code at the top level using the __name__ special variable." },
        "if __name__ == \"__main__\":\n\t${1:main()}$0"),
}
