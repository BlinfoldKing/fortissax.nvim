require("which-key").setup {
    triggers = {"<space>"},
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
    s = {
        name = "save",
        s = { "<cmd>w<cr>", "save" },
        q = { "<cmd>wq<cr>", "save and quit" }
    },
    g = {
        name = "git",
        s = { "<cmd>Git<cr>", "status" },
        c = { "<cmd>Git commit<cr>", "commit" },
        p = { "<cmd>Git push<cr>", "push" }
    },
    l = {
        name = "language",
        t = {
            name = "tag and symbol",
            o = { "<cmd>SymbolsOutline<cr>", "outline" },
            f = { "<cmd>Telescope treesitter<cr>", "find symbol" },
        },
        l = {
            name = "LSP",
            d = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "goto definition" },
            D = { "<cmd>lua vim.lsp.buf.definition()<CR>", "goto declaration" },
            h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "hover" },
            f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "format" },
            i = { "<cmd>lua vim.lsp.buf.incoming_calls()<CR>", "incoming call" },
            o = { "<cmd>lua vim.lsp.buf.outgoing_calls()<CR>", "outgoing call" },
            r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "rename" },
            a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "code action" },
            m = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "implementation" },
            s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "signature help" },
            t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "type definition" },
            n = { "<cmd>lua vim.lsp.buf.references()<CR>", "references" },
        },
        d = { "<cmd>Trouble document_diagnostics<cr>", "diagnostic" },
    },
    t = {
        name = "terminal",
        t = { "<cmd>ToggleTerm direction=float<cr>", "float" },
        h = { "<cmd>ToggleTerm size=20 direction=horizontal<cr>", "horizontal" },
        v = { "<cmd>ToggleTerm size=50 direction=vertical<cr>", "vertical" },
    },
    w = {
        name = "window",
        s = { "<cmd>WinShift<cr>", "shift window" },
    },
    q = { "<cmd>qa!<cr>", "close all and exit" }
}, { prefix = "<space>" })
