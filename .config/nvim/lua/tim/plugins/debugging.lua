return {
    {"nvim-neotest/nvim-nio" },
    {

        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
            vim.keymap.set("n", "<Leader>dc", dap.continue, {})

            local sign = vim.fn.sign_define

            local dap_round_groups =
            { "DapBreakpoint", "DapBreakpointCondition", "DapBreakpointRejected", "DapLogPoint" }
            for _, group in pairs(dap_round_groups) do
                sign(group, { text = "●", texthl = group })
            end

            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = "codelldb",
                    args = { "--port", "${port}" },
                },
            }

            dap.adapters.lldb = {
                type = "executable",
                command = "/opt/homebrew/bin/lldb-vscode",
                name = "lldb",
            }

            dap.configurations.rust = {
                {
                    name = "Launch",
                    type = "lldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = {},
                },
            }
        end,
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            local debugpy_python_path = require("mason-registry").get_package("debugpy"):get_install_path()
                .. "/venv/bin/python3"
            require("dap-python").setup(debugpy_python_path)
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dapui.setup()
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end,
    },
}
