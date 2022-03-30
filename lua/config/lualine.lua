local lualine = require('lualine')

local colors = {
    primary = '#cf3b3d',
    secondary = '#ffd670',
    grey = '#a0a1a7',
    black = '#0c0a0d',
    white = '#f5efed',
    error       = "#CF3B3D",
    info        = "#23967F",
    hint        = "#00C2D1",
    warn        = "#FFD670",
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

-- ins_left {
--   function()
--     return '▊'
--   end,
--   color = { fg = colors.blue }, -- Sets highlighting of component
--   padding = { left = 0, right = 1 }, -- We don't need space before this
-- }

local mode_color_fg = {
  n = colors.primary,
  i = colors.black,
  v = colors.black,
  [''] = colors.black,
  V = colors.black,
  c = colors.black,
  no = colors.black,
  s = colors.black,
  S = colors.black,
  ic = colors.black,
  R = colors.black,
  Rv = colors.black,
  cv = colors.black,
  ce = colors.black,
  r = colors.black,
  rm = colors.black,
  ['r?'] = colors.black,
  ['!'] = colors.black,
  t = colors.black,
}

local mode_color = {
  n = colors.black,
  i = colors.primary,
  v = colors.secondary,
  [''] = colors.info,
  V = colors.info,
  c = colors.secondary,
  no = colors.primary,
  s = colors.secondary,
  S = colors.secondary,
  ic = colors.secondary,
  R = colors.hint,
  Rv = colors.hint,
  cv = colors.primary,
  ce = colors.primary,
  r = colors.primary,
  rm = colors.primary,
  ['r?'] = colors.hint,
  ['!'] = colors.primary,
  t = colors.primary,
}

ins_left {
  -- mode component
  function()
    return 'fortissax'
  end,
  color = function()
    -- auto change color according to neovims mode

    return { bg = mode_color[vim.fn.mode()], fg = mode_color_fg[vim.fn.mode()] }
  end,
  padding = { right = 1 },
}

ins_left {
  -- filesize component
  'filesize',
  cond = conditions.buffer_not_empty,
}

ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
  color = { fg = colors.primary, gui = 'bold' },
}

ins_left { 'location' }

ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = colors.error },
    color_warn = { fg = colors.warn },
    color_info = { fg = colors.info },
  },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return '%='
  end,
}

ins_left {
  -- Lsp server name .
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' LSP:',
  color = { fg = '#ffffff', gui = 'bold' },
}

-- Add components to right sections
ins_right {
  'o:encoding', -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = colors.primary, gui = 'bold' },
}

ins_right {
  'fileformat',
  fmt = string.upper,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.primary, gui = 'bold' },
}

ins_right {
  'branch',
  icon = '',
  color = { fg = colors.primary, gui = 'bold' },
}

ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = ' ', modified = '柳 ', removed = ' ' },
  diff_color = {
    added = { fg = colors.info },
    modified = { fg = colors.hint },
    removed = { fg = colors.error },
  },
  cond = conditions.hide_in_width,
}

ins_right {
  function()
    return '▊'
  end,
  color = { fg = colors.primary },
  padding = { left = 1 },
}

-- Now don't forget to initialize lualine
lualine.setup(config)
