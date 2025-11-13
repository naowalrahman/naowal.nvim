-- local providers = require "codecompanion.providers"
-- local ui_utils = require "codecompanion.utils.ui"
local roles = {
    LLM = "llm",
    USER = "user",
    SYSTEM = "system",
}

SYSTEM_PROMPT = io.open(vim.fn.stdpath "config" .. "/lua/plugins/codecompanion/system-prompt.md", "r"):read "*a"

return {
    strategy = "workflow",
    description = "Full-fledged agentic coding assistant",
    opts = {
        is_default = true,
        short_name = "agent",
    },
    prompts = { -- prompts are grouped together to make a workflow
        {
            {
                role = roles.SYSTEM,
                content = SYSTEM_PROMPT,
            },
            {
                role = roles.USER,
                content = "Keeping all of the instructions in mind, please make a plan for the following task. Do NOT write any code or make any changes to the codebase yet. Use the tools available @{Agent} to help you. Then, ask me if the plan is good to proceed with, or if any changes are necessary.\n\nTask: ",
                opts = { auto_submit = false },
            },
        },
        {
            {
                role = roles.USER,
                content = "Based on the following feedback, proceed with and implement the plan. You may now start editing the codebase. Use the tools available @{Agent} to accomplish the task.\n\nFeedback: ",
                auto_submit = false,
            },
        },
        {
            {
                role = roles.USER,
                content = "Please generate a comprehensive summary of the changes you have implemented using markdown, keeping in mind all of the instructions.",
                auto_submit = true,
            },
        },
    },
}
