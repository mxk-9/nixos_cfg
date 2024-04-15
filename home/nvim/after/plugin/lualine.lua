local custom_horizon = require'lualine.themes.horizon'

-- default bg color is 1A1C23
custom_horizon.normal.c.bg = "#2f3139"
custom_horizon.insert.c.bg = "#2f3139"
custom_horizon.visual.c.bg = "#2f3139"
custom_horizon.replace.c.bg = "#2f3139"
custom_horizon.command.c.bg = "#2f3139"
custom_horizon.inactive.c.bg = "#2f3139"

require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = custom_horizon,
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {'filename'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}
