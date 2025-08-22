local wezterm = require("wezterm")

return {
  font = wezterm.font_with_fallback({
    "0xProto",
  }),
  window_background_opacity = 0.95,
  window_decorations = "RESIZE",

  enable_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
}

