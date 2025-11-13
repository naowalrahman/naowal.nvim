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
    acp = {
        gemini_cli = function()
            return require("codecompanion.adapters").extend("gemini_cli", {
                env = {
                    api_key = "cmd: \\cat $HOME/Desktop/apikeys/gemini.txt.txt",
                },
            })
        end,
    },
}
