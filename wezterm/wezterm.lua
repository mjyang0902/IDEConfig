local wezterm = require("wezterm")

local config = wezterm.config_builder()
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 15

config.enable_tab_bar = false
config.window_decorations = "TITLE | RESIZE"
config.colors = {
  background = '#1e1d2e',
}
-- config.color_scheme = 'Gruvbox (Gogh)'
config.color_scheme = 'catppuccin-macchiato'
-- config.color_scheme = 'Vs Code Dark+ (Gogh)'
config.native_macos_fullscreen_mode = true
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

local act = wezterm.action
config.keys = {
  {
    key = 'c',
    mods = 'CTRL',
    action = wezterm.action_callback(function(window, pane)
      local has_selection = window:get_selection_text_for_pane(pane) ~= ''
      if has_selection then
        window:perform_action(
          act.CopyTo 'ClipboardAndPrimarySelection',
          pane
        )
        window:perform_action(act.ClearSelection, pane)
      else
        window:perform_action(
          act.SendKey { key = 'c', mods = 'CTRL' },
          pane
        )
      end
    end),
  },
  { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
}

return config
