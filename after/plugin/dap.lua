local dap, dapui = require("dap"), require("dapui")
vim.keymap.set('n', '<leader>dd', function()
  dapui.setup({
    controls = {
      element = "repl",
      enabled = false,
    }
  }
  )
  -- Automatically open ui elements on dap events
  dap.listeners.before.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
  -- Keymappings
  vim.keymap.set('n', '<F5>', function() dap.continue() end)
  vim.keymap.set('n', '<F10>', function() dap.step_over() end)
  vim.keymap.set('n', '<F11>', function() dap.step_into() end)
  vim.keymap.set('n', '<F12>', function() dap.step_out() end)
  vim.keymap.set('n', '<leader>b', function() dap.toggle_breakpoint() end)
end)
-- Adapters
-- Dart, Flutter
dap.adapters.dart = {
  type = "executable",
  command = "node",
  args = { vim.fn.stdpath("data") .. "/site/pack/packer/opt/Dart-Code/out/dist/debug.js", "flutter" }
}
dap.configurations.dart = {
  {
    type = "dart",
    request = "launch",
    name = "Launch flutter",
    dartSdkPath = os.getenv('HOME') .. "/flutter/bin/cache/dart-sdk/",
    flutterSdkPath = os.getenv('HOME') .. "/flutter",
    program = "${workspaceFolder}/lib/main.dart",
    cwd = "${workspaceFolder}",
  }
}
-- End of Dart, Flutter
-- Go
dap.adapters.go = {
  type = 'executable',
  command = 'node',
  args = { vim.fn.stdpath("data") .. "/site/pack/packer/opt/vscode-go/dist/debugAdapter.js" },
}
dap.configurations.go = {
  {
    type = 'go',
    name = 'Debug',
    request = 'launch',
    showLog = false,
    program = "${file}",
    dlvToolPath = vim.fn.exepath('dlv')
  }
}
-- End of Go
-- JS, TS
require("dap-vscode-js").setup({
  debugger_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
  adapters = { 'pwa-node' },                                                         -- which adapters to register in nvim-dap
})

for _, language in ipairs({ "typescript", "javascript" }) do
  require("dap").configurations[language] = {
    -- NodeJS
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require 'dap.utils'.pick_process,
      cwd = "${workspaceFolder}",
    },
    -- Jest
    {
      type = "pwa-node",
      request = "launch",
      name = "Debug Jest Tests",
      -- trace = true, -- include debugger info
      runtimeExecutable = "node",
      runtimeArgs = {
        "./node_modules/jest/bin/jest.js",
        "--runInBand",
      },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    },
    -- Mocha
    {
      type = "pwa-node",
      request = "launch",
      name = "Debug Mocha Tests",
      -- trace = true, -- include debugger info
      runtimeExecutable = "node",
      runtimeArgs = {
        "./node_modules/mocha/bin/mocha.js",
      },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    }
  }
end
-- End of JS, TS
