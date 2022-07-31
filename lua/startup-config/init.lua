local theta = require("alpha.themes.theta")
local dashboard = require("alpha.themes.dashboard")

local header = {
	type = "text",
	val = {
		[[⠈⠻⢿⣿⣀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣗⢀⠀⠀⠀⠀⠀⠀⠀⠀⠠⢀⡉⠇⠀]],
		[[⠀⠀⠈⠛⣿⣦⠶⠂⠀⠀⠀⠀⠀⠈⠻⡝⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠘⢾⣷⣄⠀⣀⣀⣠⣤⣄⣤⣌⣀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠁⠀⠀]],
		[[⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣯⣿⡛⢳⣦⡀⡀⠀⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣼⣴⣿⣿⠂⠀⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⡀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠅⠂⠀⠀⠀⠀⠀⠀⠀]],
		[[⠄⢛⠀⠀⠀⠘⢻⣿⣿⣿⢿⡽⣿⣿⣿⣿⣿⣿⣿⣿⡧⠆⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⢘⡀⠀⠀⠀⠹⣿⠛⠿⠎⢳⣛⣿⣿⣯⣿⣿⣿⠗⢁⠀⠂⠀⡀⠐⡀⠀⠀]],
		[[⠀⠸⠁⠀⠀⠀⠀⠃⡃⢀⠀⠘⠋⢋⢿⣿⣿⡿⡿⠘⠂⠂⠀⠀⠈⠘⡀⠀⠀]],
		[[⠀⠀⠇⠀⠀⠀⠀⠈⠀⢀⣀⣤⣴⠟⠸⡻⠟⡙⠀⠐⠀⠀⠀⠀⠦⠨⡀⠠⢠]],
		[[⠀⠀⠘⡀⠀⠀⠀⠀⠀⠀⠠⠾⡟⠀⠀⠘⣷⠄⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀]],
		[[⠀⢀⠤⢃⠀⠀⡀⠀⢐⡘⠐⠂⠙⢆⠀⢠⡈⢀⠁⣄⠀⡀⠀⠀⠀⡤⠤⠏⠀]],
		[[⠀⢨⡅⠚⣀⣀⠄⠀⡁⠀⠠⡀⠄⢠⢷⣾⣕⠁⢰⢋⠥⠀⠁⠄⠀⠐⠒⡁⠀]],
		[[⠀⠘⡂⠰⢃⡀⠈⠀⠀⠀⠀⠐⡠⠀⠀⢃⠘⠑⡜⠀⠀⠃⢀⠀⠀⠣⠈⠃⠀]],
		[[⠀⢘⠆⠠⢳⠁⠀⠀⠀⠀⠀⠀⠈⠀⠀⣸⢆⠀⠀⠀⠘⡠⠘⠀⠀⠀⠀⣀⠀]],
	},
	opts = {
		position = "center",
		hl = "Function",
		-- wrap = "overflow";
	},
}

local more_recent_file = {
	type = "group",
	val = {
		dashboard.button("m", "ﱐ  More Recent Files", "<cmd>Telescope oldfiles<CR>"),
	},
	position = "center",
}

local buttons = {
	type = "group",
	val = {
		{ type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
		{ type = "padding", val = 1 },
		dashboard.button("n", "  New file", "<cmd>ene<CR>"),
		dashboard.button("e", "פּ  File Explorer", "<cmd>NvimTreeToggle<CR>"),
		dashboard.button("f", "  Find file", "<cmd>Telescope find_files<CR>"),
		dashboard.button("g", "  Live grep", "<cmd>Telescope live_grep<CR>"),
		dashboard.button("c", "  Configuration", "<cmd>cd ~/.config/nvim/ <CR>"),
		dashboard.button("u", "  Update plugins", "<cmd>PackerSync<CR>"),
		dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
	},
	position = "center",
}

local config = theta.config

config.layout[2] = header
table.insert(config.layout[4].val, more_recent_file)
config.layout[6] = buttons

require("alpha").setup(config)
