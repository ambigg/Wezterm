local gpu_adapters = require("utils.gpu-adapter")
local colors = require("colors.custom")

return {
	-- Performance
	max_fps = 120,
	animation_fps = 120,
	front_end = "WebGpu",
	webgpu_power_preference = "HighPerformance",
	webgpu_preferred_adapter = gpu_adapters:pick_best(),

	-- Cursor
	default_cursor_style = "BlinkingBlock",
	cursor_blink_rate = 800,
	cursor_blink_ease_in = "EaseOut",
	cursor_blink_ease_out = "EaseOut",

	-- Colors
	colors = colors,

	-- Window Transparency & Blur (macOS)
	window_background_opacity = 0.90, -- Ajusta entre 0.7 - 0.95
	macos_window_background_blur = 30, -- Ajusta entre 10 - 50

	-- Window
	window_decorations = "RESIZE", -- Oculta barra de título nativa
	window_padding = {
		left = 8,
		right = 8,
		top = 8,
		bottom = 8,
	},
	window_close_confirmation = "NeverPrompt",
	adjust_window_size_when_changing_font_size = false,

	-- Tab Bar
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = true,
	tab_max_width = 32,
	show_tab_index_in_tab_bar = false,
	switch_to_last_active_tab_when_closing_tab = true,

	-- Tab Bar Colors
	window_frame = {
		active_titlebar_bg = "#1e1e2e",
		inactive_titlebar_bg = "#181825",
	},

	-- Scrollbar
	enable_scroll_bar = true, -- Cambié a false, se ve más limpio

	-- Panes inactivos (mantén igual brillo/saturación)
	inactive_pane_hsb = {
		saturation = 1.0,
		brightness = 1.0,
	},

	-- Command Palette
	command_palette_fg_color = "#cdd6f4",
	command_palette_bg_color = "#1e1e2e",
	command_palette_font_size = 13,
	command_palette_rows = 20,

	-- Text
	underline_thickness = "2px",

	-- Visual Bell
	visual_bell = {
		fade_in_function = "EaseIn",
		fade_in_duration_ms = 150,
		fade_out_function = "EaseOut",
		fade_out_duration_ms = 150,
		target = "CursorColor",
	},
}
