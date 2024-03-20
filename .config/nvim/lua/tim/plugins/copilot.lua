return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        config = function()
            require("copilot").setup()
        end,
        event = "InsertEnter",
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end,
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        opts = {
            show_help = "yes",         -- Show help text for CopilotChatInPlace, default: yes
            debug = true,              -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
            disable_extra_info = "no", -- Disable extra information (e.g: system prompt) in the response.
            language = "English",      -- Copilot answer language settings when using default prompts. Default language is English.
            -- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
            -- temperature = 0.1,
        },
        dependencies = {
            { "zbirenbaum/copilot.lua" },
            { "nvim-telescope/telescope.nvim" }, -- Use telescope for help actions
            { "nvim-lua/plenary.nvim" },
        },
        event = "VeryLazy",
        keys = {
            {
                "<leader>ccq",
                function()
                    local input = vim.fn.input("Quick Chat: ")
                    if input ~= "" then
                        require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
                    end
                end,
                desc = "CopilotChat - Quick chat",
            },
            {
                "<leader>cch",
                function()
                    require("CopilotChat.code_actions").show_help_actions()
                end,
                desc = "CopilotChat - Help actions",
            },
            -- Show prompts actions with telescope
            {
                "<leader>cca",
                function()
                    require("CopilotChat.code_actions").show_prompt_actions()
                end,
                desc = "CopilotChat - Help actions",
            },
            {
                "<leader>ccp",
                ":lua require('CopilotChat.code_actions').show_prompt_actions(true)<CR>",
                mode = "x",
                desc = "CopilotChat - Prompt actions",
            },
        },
    },
}
