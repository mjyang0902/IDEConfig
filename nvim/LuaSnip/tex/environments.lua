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

local get_visual = function(args, parent)
    if (#parent.snippet.env.LS_SELECT_RAW > 0) then
        return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
    else  -- If LS_SELECT_RAW is empty, return a blank insert node
        return sn(nil, i(1))
    end
end

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
    s({trig = "mk", dscr = "Math environment.", snippetType = "autosnippet"},
        fmta("$<>$",
            {
                d(1, get_visual),
            }
        )
    ),

    s({trig="beg", snippetType="autosnippet"},
        fmta(
            [[
                \begin{<>}
                    <>
                \end{<>}
            ]],
            {
                i(1),
                d(2, get_visual),
                rep(1),  -- this node repeats insert node i(1)
            }
        ),
        {condition = line_begin}
    ),
    s({trig="eq", dscr="A LaTeX equation environment"},
        fmta( -- The snippet code actually looks like the equation environment it produces.
            [[
                \begin{equation}
                    <>
                \end{equation}
            ]],
            -- The insert node is placed in the <> angle brackets
            { d(1,get_visual) },
            -- This is where I specify that angle brackets are used as node positions.
            { delimiters = "<>" }
        ),
        {condition = line_begin}
    ),
    s({trig="fra", dscr="A frame in latex beamer"},
        fmta( -- The snippet code actually looks like the equation environment it produces.
            [[
                \begin{frame}{label=<>}
                    \frametitle{<>}
                    \framesubtitle{<>}
                    <>
                \end{frame}
            ]],
            -- The insert node is placed in the <> angle brackets
            {
                i(1),
                i(2),
                i(3),
                d(4,get_visual)
            },
            -- This is where I specify that angle brackets are used as node positions.
            { delimiters = "<>" }
        ),
        {condition = line_begin}
    ),
    s({trig="fig"},
        fmta( -- The snippet code actually looks like the equation environment it produces.
            [[
                    \begin{figure}{label=<>}
                        \includegraphics[scale=<>]{figures/<>.jpg}
                    \end{figure}
                ]],
            -- The insert node is placed in the <> angle brackets
            {
                i(1),
                i(2,"0.5"),
                i(3),
            },
            -- This is where I specify that angle brackets are used as node positions.
            { delimiters = "<>" }
        )
    ),


    s({trig = "template", dscr = "Math environment."},
        fmta(
            [[
                \documentclass[12pt]{article} 
                \usepackage[T1]{fontenc}
                \usepackage{xpatch}
                \usepackage{CJKutf8}
                \usepackage{CJKulem}
                \newenvironment{TChinese}{\CJKfamily{bkai}\CJKtilde\CJKnospace}{}
                \usepackage{amsthm}
                \usepackage{bm}
                \usepackage{latexsym, amsfonts, amsmath}
                \usepackage{graphicx, mpgmpar, subfigure}

                \usepackage{amssymb} 
                \usepackage{extarrows}
                \usepackage{stmaryrd}
                \usepackage{mathtools}
                \usepackage{textcomp}
                \usepackage{chngcntr}
                \usepackage{mathrsfs}
                \usepackage{bbm}
                \usepackage{import} \usepackage{xifthen} \usepackage{pdfpages} \usepackage{transparent} 
                \usepackage{titling}
                \usepackage{tikz}
                \usepackage{tikz-cd}
                \usepackage[colorlinks,linkcolor=blue]{hyperref}
                \usepackage{dsfont}
                \usepackage{mathrsfs}
                \usepackage{listings}
                \usepackage{xcolor}
                \usepackage{geometry}
                \definecolor{codegreen}{rgb}{0,0.6,0}
                \definecolor{codegray}{rgb}{0.5,0.5,0.5}
                \definecolor{codepurple}{rgb}{0.58,0,0.82}
                \definecolor{backcolour}{rgb}{0.95,0.95,0.92}
                \lstdefinestyle{mystyle}{
                    backgroundcolor=\color{backcolour},   
                    commentstyle=\color{codegreen},
                    keywordstyle=\color{magenta},
                    numberstyle=\tiny\color{codegray},
                    stringstyle=\color{codepurple},
                    basicstyle=\ttfamily\footnotesize,
                    breakatwhitespace=false,         
                    breaklines=true,                 
                    captionpos=b,                    
                    keepspaces=true,                 
                    numbers=left,                    
                    numbersep=5pt,                  
                    showspaces=false,                
                    showstringspaces=false,
                    showtabs=false,                  
                    tabsize=2
                }
                \lstset{style=mystyle}
                \newcommand*{\circled}[1]{\lower.7ex\hbox{\tikz\draw (0pt, 0pt)%
                circle (.5em) node {\makebox[1em][c]{\small #1}};}}

                \author{<>}
                \date{\today}
                \title{\textbf{<>}}
                \geometry{margin=0.5in}
                \geometry{lmargin=0.4in}
                \geometry{rmargin=0.4in}
                \geometry{tmargin=0.3in}

                \theoremstyle{definition}
                \newtheorem{ex}{Example}
                \newtheorem{exs}{Exercise}
                \newtheorem{pr}{Problem}
                \newtheorem{df}{Definition}
                \newtheorem{thm}{Theorem}
                \newtheorem{cl}{Corollary}
                \newtheorem{pp}{Property}
                \newtheorem{prop}{Proposition}
                \newtheorem{lm}{Lemma}
                \newtheorem{clm}{Claim}
                \newtheorem*{pf}{Proof}
                \newtheorem{rmk}{Remark}
                \newtheorem{ans}{Answer}
                \newtheorem{rc}{Recall}
                \newtheorem*{sol}{Solution}
                \newtheorem{qes}{Question}
                \newtheorem{nt}{Note}
                
                \begin{document}
                \begin{CJK}{UTF8}{}
                \begin{TChinese}
                \maketitle
                <>
                \end{TChinese}
                \end{CJK} 
                \end{document}
            ]],
            {
                i(1),
                i(2),
                i(3)
            }
        ),
        {condition = line_begin}
    ),
    s({trig="template_beamer", dscr="A template of latex beamer"},
        fmta( -- The snippet code actually looks like the equation environment it produces.
            [[    
                \documentclass[x11names]{beamer}
                \setbeamertemplate{navigation symbols}{}
                \setbeamertemplate{bibliography}{\insertbiblabel}
                \setbeamertemplate{frametitle continuation}[from second]
                \setbeamertemplate{footline}
                {
                \hspace*{2em}\insertpagenumber / \insertdocumentendpage
                }
                \usepackage{mathtools}
                \usepackage{latexsym, amsfonts, amsmath}
                \usepackage{bbm}
                \title{<>}
                \author{<>}
                \institute[NTU]{
                <>
                }
                \date{\today}
                \newtheorem{prop}{Proposition}
                \begin{document}
                \frame{\titlepage}
                <>
                \begin{frame}[allowframebreaks]
                \frametitle{Bibliography}
                \tiny{\bibliographystyle{plain}}
                \bibliography{bib}
                \end{frame}
                \end{document}
            ]],
            -- The insert node is placed in the <> angle brackets
            {
                i(1),
                i(2),
                i(3),
                i(4)
            },
            -- This is where I specify that angle brackets are used as node positions.
            { delimiters = "<>" }
        ),
        {condition = line_begin}
    ),
    s({trig="template_note", dscr="A template of latex note"},
        fmta( -- The snippet code actually looks like the equation environment it produces.
            [[
                \documentclass{report}

                \input{~/Texfile/preamble}
                \input{~/Texfile/letterfonts}
                \font\nullfont=cmr10

                \title{\textbf{()}}
                \author{()}
                \date{\today}

                \begin{document}

                \maketitle
                \newpage
                % or \cleardoublepage
                \pdfbookmark[section]{\contentsname}{toc}
                \tableofcontents
                \pagebreak
                ()
                \end{document}
            ]],
            -- The insert node is placed in the <> angle brackets
            {
                i(1),
                i(2, "Amin"),
                i(3)
            },
            -- This is where I specify that angle brackets are used as node positions.
            { delimiters = "()" }
        ),
        {condition = line_begin}
    ),
    s({trig="thm", dscr="A LaTeX theorem environment"},
        fmta( -- The snippet code actually looks like the equation environment it produces.
            [[
                \begin{thm}{}{}
                    <>
                \end{thm}
            ]],
            -- The insert node is placed in the <> angle brackets
            { d(1,get_visual) },
            -- This is where I specify that angle brackets are used as node positions.
            { delimiters = "<>" }
        ),
        {condition = line_begin}
    ),
    s({trig="cl", dscr="A LaTeX Corollary environment"},
        fmta( -- The snippet code actually looks like the equation environment it produces.
            [[
                \begin{cl}{}{}
                    <>
                \end{cl}
            ]],
            -- The insert node is placed in the <> angle brackets
            { d(1,get_visual) },
            -- This is where I specify that angle brackets are used as node positions.
            { delimiters = "<>" }
        ),
        {condition = line_begin}
    ),
    s({trig="lm", dscr="A LaTeX Lemma environment"},
        fmta( -- The snippet code actually looks like the equation environment it produces.
            [[
                \begin{lm}{}{}
                    <>
                \end{lm}
            ]],
            -- The insert node is placed in the <> angle brackets
            { d(1,get_visual) },
            -- This is where I specify that angle brackets are used as node positions.
            { delimiters = "<>" }
        ),
        {condition = line_begin}
    ),
    s({trig="prop", dscr="A LaTeX Proposition environment"},
        fmta( -- The snippet code actually looks like the equation environment it produces.
            [[
                \begin{prop}{}{}
                    <>
                \end{prop}
            ]],
            -- The insert node is placed in the <> angle brackets
            { d(1,get_visual) },
            -- This is where I specify that angle brackets are used as node positions.
            { delimiters = "<>" }
        ),
        {condition = line_begin}
    ),
    s({trig="clm", dscr="A LaTeX Claim environment"},
        fmta( -- The snippet code actually looks like the equation environment it produces.
            [[
                \begin{clm}{}{}
                    <>
                \end{clm}
            ]],
            -- The insert node is placed in the <> angle brackets
            { d(1,get_visual) },
            -- This is where I specify that angle brackets are used as node positions.
            { delimiters = "<>" }
        ),
        {condition = line_begin}
    ),
    s({trig="exs", dscr="A LaTeX Exercise environment"},
        fmta( -- The snippet code actually looks like the equation environment it produces.
            [[
                \begin{exs}{}{}
                    <>
                \end{exs}
            ]],
            -- The insert node is placed in the <> angle brackets
            { d(1,get_visual) },
            -- This is where I specify that angle brackets are used as node positions.
            { delimiters = "<>" }
        ),
        {condition = line_begin}
    ),
    s({trig="ex", dscr="A LaTeX Example environment"},
        fmta( -- The snippet code actually looks like the equation environment it produces.
            [[
                \begin{ex}{}{}
                    <>
                \end{ex}
            ]],
            -- The insert node is placed in the <> angle brackets
            { d(1,get_visual) },
            -- This is where I specify that angle brackets are used as node positions.
            { delimiters = "<>" }
        ),
        {condition = line_begin}
    ),
    s({trig="df", dscr="A LaTeX Definition environment"},
        fmta( -- The snippet code actually looks like the equation environment it produces.
            [[
                \begin{df}{}{}
                    <>
                \end{df}
            ]],
            -- The insert node is placed in the <> angle brackets
            { d(1,get_visual) },
            -- This is where I specify that angle brackets are used as node positions.
            { delimiters = "<>" }
        ),
        {condition = line_begin}
    ),
    s({trig="qes", dscr="A LaTeX Question environment"},
        fmta( -- The snippet code actually looks like the equation environment it produces.
            [[
                \begin{qes}{}{}
                    <>
                \end{qes}
            ]],
            -- The insert node is placed in the <> angle brackets
            { d(1,get_visual) },
            -- This is where I specify that angle brackets are used as node positions.
            { delimiters = "<>" }
        ),
        {condition = line_begin}
    ),
    s({trig="sol", dscr="A LaTeX Solution environment"},
        fmta( -- The snippet code actually looks like the equation environment it produces.
            [[
                \begin{sol}{}{}
                    <>
                \end{sol}
            ]],
            -- The insert node is placed in the <> angle brackets
            { d(1,get_visual) },
            -- This is where I specify that angle brackets are used as node positions.
            { delimiters = "<>" }
        ),
        {condition = line_begin}
    ),
    s({trig="pf", dscr="A LaTeX Proof environment"},
        fmta( -- The snippet code actually looks like the equation environment it produces.
            [[
                \begin{pf}{}{}
                    <>
                \end{pf}
            ]],
            -- The insert node is placed in the <> angle brackets
            { d(1,get_visual) },
            -- This is where I specify that angle brackets are used as node positions.
            { delimiters = "<>" }
        ),
        {condition = line_begin}
    ),
    s({trig="nt", dscr="A LaTeX Note environment"},
        fmta( -- The snippet code actually looks like the equation environment it produces.
            [[
                \begin{nt}{}{}
                    <>
                \end{nt}
            ]],
            -- The insert node is placed in the <> angle brackets
            { d(1,get_visual) },
            -- This is where I specify that angle brackets are used as node positions.
            { delimiters = "<>" }
        ),
        {condition = line_begin}
    ),
    s({trig="rc", dscr="A LaTeX Recall environment"},
        fmta( -- The snippet code actually looks like the equation environment it produces.
            [[
                \begin{rc}{}{}
                    <>
                \end{rc}
            ]],
            -- The insert node is placed in the <> angle brackets
            { d(1,get_visual) },
            -- This is where I specify that angle brackets are used as node positions.
            { delimiters = "<>" }
        ),
        {condition = line_begin}
    ),
}


