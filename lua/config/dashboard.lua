local home = os.getenv("HOME")
local db = require("dashboard")

db.custom_header = {
	"",
	"⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣼⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄",
	"⠄⠄⠄⠄⠄⠄⠄⠄⠄⣤⣄⣠⣤⣤⣿⣤⣤⣄⣄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄",
	"⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠙⣿⡟⠈⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄",
	"⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣻⠇⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄",
	"⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣻⡆⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄",
	"⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢠⡶⠞⠿⣿⠿⠿⢶⣄⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄",
	"⠄⠄⠄⠄⠄⠄⠄⠄⠄⣌⢉⣤⡄⠄⣿⡖⢠⣄⠉⠃⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄",
	"⠄⠄⠄⠄⠄⠄⠄⠄⡀⣹⡾⣿⢶⠶⣿⣷⠶⠾⠷⣶⣄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄",
	"█▀▀ █▀█ █▀█ ▀█▀ █ █▀ █▀ ▄▀█ ▀▄▀",
	"█▀░ █▄█ █▀▄ ░█░ █ ▄█ ▄█ █▀█ █░█",
	"⠄⠄⠄⠄⠄⠄⠹⣇⠄⠚⢧⡈⠛⠓⣻⠓⣛⡟⣥⡟⠁⢠⣿⠄⠄⠄⠄⠄⠄⠄⠄",
	"⠄⠄⠄⠄⠄⠄⠄⢸⣦⠄⠈⠉⢱⡦⣭⠄⣾⠏⠉⠄⢀⣾⠋⠄⠄⠄⠄⠄⠄⠄⠄",
	"⠄⠄⠄⠄⠄⠄⠄⠄⠉⠿⢷⣶⣴⠟⣽⠿⠴⢤⣤⠾⢿⠄⠄⠄⠄⠄⠄⠄⠔⠄⠄",
	"⠂⠄⠄⠤⡀⠄⠄⠄⠄⠄⠄⠉⠄⠄⢈⠄⠄⠑⢤⡔⠋⠄⠄⠄⢀⣤⠄⠄⠄⠄⠄",
	"⠄⠄⠄⠄⠈⠐⠶⣤⠄⠄⠄⠄⡄⠄⢸⡀⢠⡀⠄⠁⠄⣀⡴⠚⠋⠁⠄⠄⠄⠄⠄",
	"⠄⠄⠄⠄⠄⠄⠄⠄⠄⠉⠛⠻⠷⠶⢿⢷⠶⠞⠁⠛⠋⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄",
	"⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠰⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄",
	"",
}

local desc = {
	start = "Press <Space> to Start",
	file = "Open File Tree        ",
	config = "Open Config           ",
	reload = "Reload Config         ",
	help = "Help                  ",
}

db.custom_center = {
	{
		icon = "🐲 ",
		desc = desc.start,
		action = "WhichKey <space>",
	},
	{
		icon = "📁 ",
		desc = desc.file,
		action = "NvimTreeToggle",
	},
	{
		icon = "🔨 ",
		desc = desc.config,
		action = "edit ~/.config/nvim/.vimrc",
	},
	{
		icon = "🔃 ",
		desc = desc.reload,
		action = "source ~/.config/nvim/.vimrc",
	},
	{
		icon = "💡 ",
		desc = desc.help,
		action = "Cheatsheet",
	},
}

db.footer_pad = 5
db.custom_footer = {
	"--- Audentes Fortuna Iuvat ---",
}
