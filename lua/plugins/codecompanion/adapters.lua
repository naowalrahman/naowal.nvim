return {
    deepseek = function()
        return require("codecompanion.adapters").extend("deepseek", {
            env = {
                api_key = "cmd: \\cat $HOME/Desktop/apikeys/deepseek-apikey.txt",
            },
            schema = { model = { default = "deepseek-chat" } },
        })
    end,
    claude4 = function()
        return require("codecompanion.adapters").extend("copilot", {
            schema = {
                model = {
                    default = "claude-sonnet-4",
                },
            },
        })
    end,
}
