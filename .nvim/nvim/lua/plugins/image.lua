return{
    "3rd/image.nvim",
        priority = 1001,
        opts = {
            backend="kitty",
            integrations = {
                    markdown = { enabled = true },
            },
        },
    config = function ()
        require("image").setup()
    end
}

