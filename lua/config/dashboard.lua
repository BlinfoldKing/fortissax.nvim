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

db.custom_center = {
	{
		icon = "🐲\t",
		desc = "Press <Space> to Start  ",
		action = "WhichKey <space>",
	},
	{
		icon = "📁\t",
		desc = "Open File Tree  ",
		action = "NvimTreeToggle",
	},
	{
		icon = "🔨\t",
		desc = "Open Config    ",
		action = "edit ~/.config/nvim/.vimrc",
	},
	{
		icon = "🔃\t",
		desc = "Reload Config  ",
		action = "source ~/.config/nvim/.vimrc",
	},
	{
		icon = "💡\t",
		desc = "Help    ",
		action = "Cheatsheet",
	},
}

db.footer_pad = 5
db.custom_footer = {
	"--- Audentes Fortuna Iuvat ---",
}
