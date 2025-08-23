local wezterm = require("wezterm")

return {
  font = wezterm.font_with_fallback({
    "JetBrains Mono",
  }),
  window_background_opacity = 0.90,
  window_decorations = "RESIZE",

  enable_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
}

