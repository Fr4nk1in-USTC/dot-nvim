local status, dap = pcall(require, "dap")

if not status then
	return
end

-- Keymapping
local map = require("helper.mapping").map
local opts = { silent = true }

map({ "n", "i", "v" }, "<F10>", dap.step_over, opts, "Step over")
map({ "n", "i", "v" }, "<F11>", dap.step_into, opts, "Step into")
map({ "n", "i", "v" }, "<F12>", dap.step_out, opts, "Step out")
map("n", "bp", dap.toggle_breakpoint, opts, "Toggle breakpoint")
map("n", "bc", function()
	return dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, opts, "Set condition breakpoint")
map("n", "bl", function()
	return dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, opts, "Set log point")
map("n", "<leader>ro", dap.repl.open, opts, "Open REPL")
map("n", "<leader>rl", dap.run_last, opts, "Run last")

-- Breakpoint Icon Setting
vim.highlight.create("DapBreakpoint", {
	ctermbg = 0,
	guifg = "#993939",
	guibg = "#8a5151",
}, false)
vim.highlight.create("DapLine", {
	ctermbg = 0,
	guibg = "#8a5151",
}, false)
vim.highlight.create("DapLogPoint", {
	ctermbg = 0,
	guifg = "#61afef",
	guibg = "#8a5151",
}, false)
vim.highlight.create("DapStopped", {
	ctermbg = 0,
	guifg = "#98c379",
	guibg = "#515c8a",
}, false)
vim.highlight.create("DapStoppedLine", {
	ctermbg = 0,
	guibg = "#515c8a",
}, false)

vim.fn.sign_define("DapBreakpoint", {
	text = "",
	texthl = "DapBreakpoint",
	linehl = "DapLine",
	numhl = "DapBreakpoint",
})
vim.fn.sign_define("DapBreakpointCondition", {
	text = "ﳁ",
	texthl = "DapBreakpoint",
	linehl = "DapLine",
	numhl = "DapBreakpoint",
})
vim.fn.sign_define("DapBreakpointRejected", {
	text = "",
	texthl = "DapBreakpoint",
	linehl = "DapLine",
	numhl = "DapBreakpoint",
})
vim.fn.sign_define("DapLogPoint", {
	text = "",
	texthl = "DapLogPoint",
	linehl = "DapLine",
	numhl = "DapLogPoint",
})
vim.fn.sign_define("DapStopped", {
	text = "",
	texthl = "DapStopped",
	linehl = "DapStoppedLine",
	numhl = "DapStopped",
})

-- DAP UI
local ui_status, dapui = pcall(require, "dapui")
if ui_status then
	dapui.setup({
		mappings = {
			-- Use a table to apply multiple mappings
			expand = { "<CR>", "<2-LeftMouse>" },
			open = "<C-o>",
			remove = "<C-d>",
			edit = "<C-e>",
			repl = "<C-r>",
			toggle = "<C-t>",
		},
	})
	map({ "n", "i", "v" }, "<F5>", function()
		dapui.open()
		return dap.continue()
	end, opts, "Continue or start debugging")
	map({ "n", "i", "v" }, "<F6>", function()
		dapui.close()
		dap.repl.close()
		return dap.terminate()
	end, opts, "Terminate debugging")
else
	map({ "n", "i", "v" }, "<F5>", dap.continue, opts, "Continue or start debugging")
	map({ "n", "i", "v" }, "<F6>", function()
		dap.repl.close()
		return dap.terminate()
	end, opts, "Terminate debugging")
end

-- DAP Virtual Text
local vt_status, dapvt = pcall(require, "nvim-dap-virtual-text")
if vt_status then
	dapvt.setup({
		commented = true,
		all_referrences = true,
		highlight_new_as_changed = true,
	})
end

-- DAP Configuration
-- Python
dap.adapters.python = {
	type = "executable",
	command = "/usr/bin/python",
	args = { "-m", "debugpy.adapter" },
}
dap.configurations.python = {
	{
		-- The first three options are required by nvim-dap
		type = "python",
		request = "launch",
		name = "Launch file",

		program = "${file}",
		pythonPath = function()
			local cwd = vim.fn.getcwd()
			if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
				return cwd .. "/venv/bin/python"
			elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
				return cwd .. "/.venv/bin/python"
			else
				return "/usr/bin/python"
			end
		end,
		stopOnEntry = false,
		console = "integratedTerminal",
	},
}

-- C/C++/Rust
dap.adapters.cppdbg = function(cb, config)
	if config.preLaunchTask then
		vim.fn.system(config.preLaunchTask)
	end
	local adapter = {
		id = "cppdbg",
		type = "executable",
		command = "/home/fushen/.local/share/nvim/dapinstall/ccppr_vsc/extension/debugAdapters/bin/OpenDebugAD7",
	}
	cb(adapter)
end
dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "cppdbg",
		request = "launch",
		preLaunchTask = "g++ -O2 -fdiagnostics-color=always -g ${file} -o ${fileDirname}/${fileBasenameNoExtension}",
		program = "${fileDirname}/${fileBasenameNoExtension}",
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		console = "integratedTerminal",
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description = "enable pretty printing",
				ignoreFailures = false,
			},
		},
	},
}
dap.configurations.c = {
	{
		name = "Launch file",
		type = "cppdbg",
		request = "launch",
		preLaunchTask = "gcc -O2 -fdiagnostics-color=always -g ${file} -o ${fileDirname}/${fileBasenameNoExtension}",
		program = "${fileDirname}/${fileBasenameNoExtension}",
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		console = "integratedTerminal",
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description = "enable pretty printing",
				ignoreFailures = false,
			},
		},
	},
}
dap.configurations.rust = {
	{
		name = "Launch file",
		type = "cppdbg",
		request = "launch",
		program = "${fileDirname}/${fileBasenameNoExtension}",
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		console = "integratedTerminal",
	},
	setupCommands = {
		{
			text = "-enable-pretty-printing",
			description = "enable pretty printing",
			ignoreFailures = false,
		},
	},
}
