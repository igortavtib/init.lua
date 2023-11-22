local dap = require('dap')

dap.set_log_level('TRACE')

dap.adapters["pwa-node"] = {
	type = "server",
	host = "localhost",
	port = 8123,
	executable = {
		command = "node",
		args = { "~/Downloads/js-debug/src/dapDebugServer.js", 8123 }
	}
}

for _, language in ipairs { "typescript", "javascript" } do
	dap.configurations[language] = { {
		type = "pwa-node",
		request = "launch",
		name = "Launch program",
		program = "${file}",
		cwd = "${workspaceFolder}"
	}, }
end

vim.keymap.set('n', '<leader>tb', "<cmd>DapToggleBreakpoint<CR>")
vim.keymap.set('n', '<leader>dr', "<cmd>DapContinue<CR>")
