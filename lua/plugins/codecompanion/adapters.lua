return {
    http = {
        deepseek = function()
            return require("codecompanion.adapters").extend("deepseek", {
                env = {
                    api_key = "cmd: \\cat $HOME/Desktop/apikeys/deepseek.txt",
                },
                schema = { model = { default = "deepseek-chat" } },
            })
        end,
    },
}
