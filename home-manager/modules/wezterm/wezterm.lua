local wezterm = require("wezterm")

return {
    font_size = 16.0,
    font = wezterm.font {
        family = 'Source Code Pro for Powerline',
        stretch = 'Expanded',
        weight = 'Regular',
    },
    line_height = 1.0,
    window_background_opacity = 0.9,
    window_decorations = "NONE",
    text_background_opacity = 1.0,
    window_padding = {
        left = 10,
        right = 10,
        top = 10,
        bottom = 10,
    },
    audible_bell = "Disabled",
    enable_tab_bar = false,
    scrollback_lines = 9000
}
