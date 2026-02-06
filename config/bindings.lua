local wezterm = require("wezterm")
local platform = require("utils.platform")
local act = wezterm.action

local mod = {}

if platform.is_mac then
	mod.SUPER = "CMD"
	mod.SUPER_REV = "CMD|CTRL"
end

-- stylua: ignore
local keys = {
    { key = 'r', mods = mod.SUPER, action = act.SendString('source ~/.zshrc\n') },

    { key = 'F1',         mods = 'NONE',        action = 'ActivateCopyMode' },
    { key = 'F2',         mods = 'NONE',        action = act.ActivateCommandPalette },
    { key = 'F11',        mods = 'NONE',        action = act.ToggleFullScreen },
    { key = 'f',          mods = mod.SUPER,     action = act.Search({ CaseInSensitiveString = '' }) },

    { key = 'c',          mods = 'CMD',         action = act.CopyTo('Clipboard') },
    { key = 'v',          mods = 'CMD',         action = act.PasteFrom('Clipboard') },

    { key = 'LeftArrow',  mods = mod.SUPER,     action = act.SendString '\x1bOH' },
    { key = 'RightArrow', mods = mod.SUPER,     action = act.SendString '\x1bOF' },
    { key = 'Backspace',  mods = mod.SUPER,     action = act.SendString '\x15' },

    { key = '-',          mods = 'CMD',         action = act.DecreaseFontSize },
    { key = '=',          mods = 'CMD',         action = act.IncreaseFontSize }, -- CMD++ real
    { key = '0',          mods = 'CMD',         action = act.ResetFontSize },

    { key = 't',          mods = mod.SUPER,     action = act.SpawnTab('DefaultDomain') },
    { key = 'w',          mods = mod.SUPER,     action = act.CloseCurrentPane({ confirm = false }) },
    { key = 'w',          mods = mod.SUPER_REV, action = act.CloseCurrentTab({ confirm = false }) },

    -- Navegación de tabs
    { key = '[',          mods = mod.SUPER,     action = act.ActivateTabRelative(-1) },
    { key = ']',          mods = mod.SUPER,     action = act.ActivateTabRelative(1) },
    { key = '[',          mods = mod.SUPER_REV, action = act.MoveTabRelative(-1) },
    { key = ']',          mods = mod.SUPER_REV, action = act.MoveTabRelative(1) },

    -- Tabs directas (opcional)
    { key = '1',          mods = mod.SUPER,     action = act.ActivateTab(0) },
    { key = '2',          mods = mod.SUPER,     action = act.ActivateTab(1) },
    { key = '3',          mods = mod.SUPER,     action = act.ActivateTab(2) },
    { key = '4',          mods = mod.SUPER,     action = act.ActivateTab(3) },
    { key = '5',          mods = mod.SUPER,     action = act.ActivateTab(4) },

    -- Toggle tab bar
    { key = '9',          mods = mod.SUPER,     action = act.EmitEvent('tabs.toggle-tab-bar') },

    { key = 'n',          mods = mod.SUPER,     action = act.SpawnWindow },
    { key = 'Enter',      mods = mod.SUPER_REV, action = act.ToggleFullScreen },

    -- Crear splits
    { key = 'v',          mods = mod.SUPER_REV, action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }) },
    { key = 'r',          mods = mod.SUPER_REV, action = act.SplitVertical({ domain = 'CurrentPaneDomain' }) },

    -- Zoom pane (maximizar temporalmente)
    { key = 'z',          mods = mod.SUPER_REV, action = act.TogglePaneZoomState },

    -- Navegar entre panes (estilo Vim)
    { key = 'h',          mods = mod.SUPER_REV, action = act.ActivatePaneDirection('Left') },
    { key = 'j',          mods = mod.SUPER_REV, action = act.ActivatePaneDirection('Down') },
    { key = 'k',          mods = mod.SUPER_REV, action = act.ActivatePaneDirection('Up') },
    { key = 'l',          mods = mod.SUPER_REV, action = act.ActivatePaneDirection('Right') },

    -- Selector visual de panes
    { key = 'p',          mods = mod.SUPER_REV, action = act.PaneSelect },

    --scroll
    { key = 'k',          mods = mod.SUPER,     action = act.ScrollByPage(-0.5) },
    { key = 'j',          mods = mod.SUPER,     action = act.ScrollByPage(0.5) },
    { key = 'PageUp',     mods = 'NONE',        action = act.ScrollByPage(-1) },
    { key = 'PageDown',   mods = 'NONE',        action = act.ScrollByPage(1) },

    -- CARACTERES ESPAÑOLES (macOS) - Mapeos WezTerm
    { key = 'q',          mods = 'ALT',         action = act.SendString '@' },
    { key = '3',          mods = 'ALT',         action = act.SendString '#' },
    { key = '{',          mods = 'ALT',         action = act.SendString '[' },
    { key = '}',          mods = 'ALT',         action = act.SendString ']' },
    { key = '\'',         mods = 'ALT',         action = act.SendString '\\' },
    { key = 'ñ',          mods = 'ALT',         action = act.SendString '~' }, -- Alternativa para \
    { key = 'ª',          mods = 'ALT',         action = act.SendString '|' },  -- Otra alternativa

}

local key_tables = {
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 2 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 2 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 2 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 2 }) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "q", action = "PopKeyTable" },
	},
}

-- ============================================
-- 🖱️ MOUSE
-- ============================================
local mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CMD",
		action = act.OpenLinkAtMouseCursor,
	},
	{
		event = { Down = { streak = 3, button = "Left" } },
		mods = "NONE",
		action = act.SelectTextAtMouseCursor("SemanticZone"),
	},
}

return {
	disable_default_key_bindings = true,
	leader = { key = "Space", mods = mod.SUPER_REV }, -- CMD+CTRL+Space
	keys = keys,
	key_tables = key_tables,
	mouse_bindings = mouse_bindings,
}
