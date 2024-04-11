return {
    {
        -- インサートモードを抜ける時にIMEをOFFにする
        "keaising/im-select.nvim",
        config = function()
            require("im_select").setup({})
        end,
    },
}
