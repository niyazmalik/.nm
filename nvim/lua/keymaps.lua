
vim.g.mapleader = " "

-- Escape with kj
vim.keymap.set("i", "kj", "<Esc>", { noremap = true })

-- Snippet expansion
vim.keymap.set({"i", "s"}, "hh", function()
    require("luasnip").expand()
end, { desc = "Expand snippet" })

-- Brace navigation
vim.keymap.set("n", "<A-j>", "]m", { desc = "Next brace" })
vim.keymap.set("n", "<A-k>", "[m", { desc = "Previous brace" })

-- Move in insert mode
vim.keymap.set("i", "<A-h>", "<Left>", { desc = "Move left" })
vim.keymap.set("i", "<A-l>", "<Right>", { desc = "Move right" })

-- Tab navigation
vim.keymap.set('n', '<Tab>', '4l', { noremap = true })
vim.keymap.set('n', '<S-Tab>', '4h', { noremap = true })

-- Toggle comment
vim.keymap.set({"n", "v"}, "<leader>c", function()
    local mode = vim.fn.mode()
    local function toggle_slash_comment(line)
        local indent = line:match("^(%s*)") or ""
        local content = line:sub(#indent + 1)
        if content:match("^//") then
            content = content:gsub("^//%s*", "")
        else
            content = "// " .. content
        end
        return indent .. content
    end
    
    if mode == "v" or mode == "V" then
        local start_line = vim.fn.line("v")
        local end_line = vim.fn.line(".")
        if start_line > end_line then
            start_line, end_line = end_line, start_line
        end
        for i = start_line, end_line do
            local line = vim.fn.getline(i)
            vim.fn.setline(i, toggle_slash_comment(line))
        end
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
    else
        local line = vim.api.nvim_get_current_line()
        vim.api.nvim_set_current_line(toggle_slash_comment(line))
    end
end, { desc = "Toggle // comment" })
