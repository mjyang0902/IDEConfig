return{
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    keys = {
        { '<leader>td', ':ToggleTerm size=10 direction=horizontal name=desktop <CR>', desc = 'open the terminal',
        mode = {'n','v'}},
    },
}
