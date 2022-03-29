require("which-key").setup {
    triggers = {"<leader>"},
}

local wk = require("which-key")
wk.register({
    f = {
        name = "file and finder",
        t = { "<cmd>NvimTreeToggle<cr>", "file tree" },
        f = { "<cmd>Telescope find_files<cr>", "find file" },
        b = { "<cmd>Telescope buffers<cr>", "find buffer" },
        p = { "<cmd>Telescope live_grep<cr>", "find pattern" },
    },
    w = {
        name = "save",
        w = { "<cmd>w<cr>", "save" },
        q = { "<cmd>wq<cr>", "save and quit" }
    },
    l = {
        name = "language",
        t = {
            name = "tag and symbol",
            o = { "<cmd>SymbolsOutline<cr>", "outline" },
            f = { "<cmd>Telescope treesitter<cr>", "find symbol" },
        }
    },
    t = {
        name = "terminal",
        t = { "<cmd>ToggleTerm direction=float<cr>", "float" },
        h = { "<cmd>ToggleTerm size=20 direction=horizontal<cr>", "horizontal" },
        v = { "<cmd>ToggleTerm size=50 direction=vertical<cr>", "vertical" },
    },
    q = { "<cmd>q<cr>", "quit" }
}, { prefix = "<leader>" })
