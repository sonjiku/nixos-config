local map = require("lib.key").map

return {
    {
        "mfussenegger/nvim-dap",
        lazy = true,
        config = function()
            map('n',        '<Leader>D<space>', "<cmd>lua require('dap').continue()<cr>",
                "[DAP] Continue")
            map('n',        '<Leader>D-', "<cmd>lua require('dap').restart()<cr>",
                "[DAP] Restart")
            map('n',        '<Leader>Dk', "<cmd>lua require('dap').step_out()<cr>",
                "[DAP] Step out")
            map('n',        '<Leader>Dl', "<cmd>lua require('dap').step_over()<cr>",
                "[DAP] Step over")
            map('n',        '<Leader>Dh', "<cmd>lua require('dap').step_back()<cr>",
                "[DAP] Step back")
            map('n',        '<Leader>Dj', "<cmd>lua require('dap').step_into()<cr>",
                "[DAP] Step into")
            map('n',        "<leader>dgt", "<cmd>lua require('dap').set_log_level('TRACE')<CR>",
                "[DAP] DebuG Trace")
            map('n',        "<leader>dgt", '<CMD>lua vim.cmd(":edit " .. vim.fn.stdpath("cache") .. "/dap.log")<CR>',
                "[DAP] DebuG Edit")
            map("n", "<leader>d_", '<CMD>lua require("dap").terminate()<CR><CMD>require("dapui").close()<CR>',
                "[DAP] Close")
            map('n',        '<Leader>Db', "<cmd>lua require('dap').toggle_breakpoint()<cr>",
                "[DAP] Toggle Breakpoint")
            map('n',        '<Leader>D<C-b>', "<cmd>lua require('dap').set_breakpoint()<cr>",
                "[DAP] Set Breakpoint")
            map('n',        '<Leader>DB', "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
                "[DAP] Breakpoint msg")
            map('n',        '<Leader>Do', "<cmd>lua require('dap').repl.open()<cr>",
                "[DAP] Repl open")
            map('n',        '<Leader>D.', "<cmd>lua require('dap').run_last()<cr>",
                "[DAP] Run last")
            map({'n', 'v'}, '<Leader>Dh', "<cmd>lua require('dap.ui.widgets').hover()<cr>",
                "[DAP] Open Hover")
            map({'n', 'v'}, '<Leader>DP', "<cmd>lua require('dap.ui.widgets').preview()<cr>",
                "[DAP] Open Preview")
            map('n',        '<Leader>Df', "<cmd>lua local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.frames)<cr>",
                "[DAP] Frames")
            map('n',        '<Leader>Ds', "<cmd>lua local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.scopes)<cr>",
                "[DAP] Scopes")

            local dap = require('dap')
            dap.adapters.python = function(cb, config)
                if config.request == 'attach' then
                    ---@diagnostic disable-next-line: undefined-field
                    local port = (config.connect or config).port
                    ---@diagnostic disable-next-line: undefined-field
                    local host = (config.connect or config).host or '127.0.0.1'
                    cb({
                    type = 'server',
                    port = assert(port, '`connect.port` is required for a python `attach` configuration'),
                    host = host,
                    options = {
                        source_filetype = 'python',
                    },
                    })
                else
                    cb({
                    type = 'executable',
                    command = 'debugpy-adapter',
                    -- command = 'path/to/virtualenvs/debugpy/bin/python',
                    -- args = { '-m', 'debugpy.adapter' },
                    options = {
                        source_filetype = 'python',
                    },
                    })
                end
            end
            dap.configurations.python = {
                {
                    -- The first three options are required by nvim-dap
                    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
                    request = 'launch';
                    name = "Launch file";

                    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

                    program = "${file}"; -- This configuration will launch the current file if used.
                    pythonPath = function()
                        -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
                        -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
                        -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
                        local cwd = vim.fn.getcwd()
                        if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                            return cwd .. '/venv/bin/python'
                        elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                            return cwd .. '/.venv/bin/python'
                        else
                            return '/run/current-system/sw/bin/python'
                            -- return '/usr/bin/python'
                        end
                    end;
                },
            }
        end,
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        dependancies = {
            "mfussenegger/nvim-dap",
            'nvim-treesitter/nvim-treesitter'
        },
        config = function()
            require("nvim-dap-virtual-text").setup()
        end,
    },
    {
        "LiadOz/nvim-dap-repl-highlights",
        config = function()
            require('nvim-dap-repl-highlights').setup()
            local dap = require('dap')
            dap.configurations.python = {
                {
                    name = "Python with javascript repl because I like to watch the world burn!",
                    type = "python",
                    request = "launch",
                    program = "${file}",
                    -- repl_lang = "python"
                },
            }
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        config = function()
            require("dapui").setup()
            -- Note: Added this <leader>dd duplicate of <F5> because somehow the <F5>
            -- mapping keeps getting reset each time I restart nvim-dap. Annoying but whatever.
            map({'n', 'v'}, "<leader>De", "<cmd>lua require('dapui').eval()<cr>", "[DAP] Evaluate")
            map("n", "<leader>Dd", '<CMD>lua require("dapui").open()<CR><CMD>lua vim.cmd[[DapContinue]]<CR>',
                "[DAP] Start DAPui")
        end,
        dependencies = {
            "nvim-neotest/nvim-nio",
            "mfussenegger/nvim-dap",
        },
    },
}
