return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            auto_install = true,
            ensure_installed = { "lua", "json", "yaml", "python", "rust" },
            highlight = { enabled = true },
            indent = { enabled = true },
        })
    end
}
