return {
    "lervag/vimtex",
    ft = 'tex',
    lazy = false,
    dependencies = {
        "KeitaNakamura/tex-conceal.vim",
    },
    init = function()
        vim.g.tex_flavor = 'latex'
        -- -- use skim as the default pdf reviewer
        vim.g.vimtex_view_method = 'skim'
        vim.g.vimtex_view_skim_sync = 1
        vim.g.vimtex_view_skim_activate = 1

        -- vim.g.vimtex_view_general_viewer = 'zathura'
        -- show the compiler hint
        vim.g.vimtex_compiler_progname = 'nvr'
        vim.g.vimtex_quick_mode = 0

        -- hide the last two lines
        vim.g.tex_conceal = 'abdmg'

        vim.g.vimtex_quickfix_ignore_filters = {
            "Command terminated with space",
            "LaTeX Font Warning: Font shape",
            "Package caption Warning: The option",
            [[Underfull \\hbox (badness [0-9]*) in]],
            "Package enumitem Warning: Negative labelwidth",
            [[Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in]],
            [[Package caption Warning: Unused \\captionsetup]],
            "Package typearea Warning: Bad type area settings!",
            [[Package fancyhdr Warning: \\headheight is too small]],
            "Package hyperref Warning: Token not allowed in a PDF string",
            [[Underfull \\hbox (badness [0-9]*) in paragraph at lines]],
            [[Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in paragraph at lines]],
            "Missing character: There is no ; in font nullfont!",
        }
    end,
}


