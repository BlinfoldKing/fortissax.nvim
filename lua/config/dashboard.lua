local home = os.getenv("HOME")
local db = require("dashboard")

db.default_executive = "telescope"
db.preview_command = "cat"
db.preview_file_path = home .. "/.config/nvim/misc/art.cat"
db.preview_file_height = 18
db.preview_file_width = 33
