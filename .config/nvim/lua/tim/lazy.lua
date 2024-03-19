local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("tim.plugins")

local lsp_zero = require("lsp-zero")
local builtin = require("telescope.builtin")

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
    --vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = bufnr })
    vim.keymap.set("n", "<leader>od", function()
        builtin.lsp_document_symbols({ fname_width = 100 })
    end)
    vim.keymap.set("n", "<leader>ow", function()
        builtin.lsp_dynamic_workspace_symbols({ fname_width = 100 })
    end)
end)

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {},
    handlers = {
        lsp_zero.default_setup,
    },
})

local lspkind = require("lspkind")

local cmp = require("cmp")
cmp.setup({
    sources = {
        { name = "copilot", group_index = 2 },
        { name = "nvim_lsp" },
        { name = "path",    group_index = 2 },
        { name = "luasnip", group_index = 2 },
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = "select" }),
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        ["<C-space>"] = cmp.mapping.complete(),
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol",
            max_width = 50,
            symbol_map = { Copilot = "" },
            ellipsis_char = "...",
            show_labelDetails = true,
        }),
    },
})

require("lspconfig").yamlls.setup({
    settings = {
        yaml = {
            validate = true,
            -- disable the schema store
            schemaStore = {
                enable = false,
                url = "",
            },
            -- manually select schemas
            schemas = require("schemastore").yaml.schemas(),
        },
    },
})

require("git-worktree").setup()
require("telescope").load_extension("git_worktree")
