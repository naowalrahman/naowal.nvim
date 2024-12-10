-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local compile_commands = {
    cpp = "g++ % -o %:r",
    c = "gcc % -o %:r",
    java = "javac %",
}

local run_commands = {
    python = "python3 %",
    lua = "lua %",
    cpp = "./%:r",
    c = "./%:r",
    java = "java %:r",
    sh = "bash %",
}

local function process_file(compile)
    local filetype = vim.bo.filetype
    local command = ""
    if compile then
        command = compile_commands[filetype]
    else
        command = run_commands[filetype]
    end

    if command then
        -- Create a terminal buffer in a new split
        vim.api.nvim_open_win(0, true, {
            width = vim.o.columns,
            height = 15,
            split = "below",
        })
        if compile then
            vim.cmd("term sh -c \"echo 'Compiling...';" .. command .. "; read -p 'Press Enter to continue...'\"")
        else
            vim.cmd('term sh -c "' .. command .. "; echo -e ''; read -p 'Press Enter to continue...'\"")
        end

        -- Create autogroup for terminal settings
        local term_group = vim.api.nvim_create_augroup("TerminalSettings", { clear = true })
        vim.api.nvim_create_autocmd("TermClose", {
            group = term_group,
            pattern = "*",
            callback = function()
                if vim.v.event.status == 0 then
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, true, true), "n", false)
                end
            end,
        })

        -- Switch to terminal insert mode
        vim.cmd "startinsert"
    else
        vim.notify("No command found for filetype: " .. filetype)
    end
end

vim.api.nvim_create_user_command("CompileFile", function() process_file(true) end, {})
vim.api.nvim_create_user_command("RunFile", function() process_file(false) end, {})
