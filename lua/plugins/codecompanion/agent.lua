-- local providers = require "codecompanion.providers"
-- local ui_utils = require "codecompanion.utils.ui"

local fmt = string.format

local roles = {
    LLM = "llm",
    USER = "user",
    SYSTEM = "system",
}

return {
    strategy = "workflow",
    description = "Full-fledged agentic coding assistant",
    opts = {
        is_default = true,
        short_name = "agent",
    },
    prompts = { -- prompts are grouped together to make a workflow
        {
            role = roles.LLM,
            content = function(context)
                return fmt "system prompt" -- TODO: get good system prompt
            end,
        },
        {
            roole = roles.USER,
            content = "",
            opts = { auto_submit = false },
        },
    },
}
