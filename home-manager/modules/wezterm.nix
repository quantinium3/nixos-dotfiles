{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return {
        color_scheme = "Catppuccin Mocha",
        foreground = "#FFFFFF",  -- Main text color (often a light grey in Mocha)
        font = wezterm.font "Fira Code",
        font_size = 16.0,
        line_height = 1.0,
        foreground_text_hsb = {
          hue = 1.0,
          saturation = 1.0,
          brightness = 1.0
        },
        hide_tab_bar_if_only_one_tab = true,
        window_background_opacity = 0.9,
        text_background_opacity = 1.0,
        window_padding = {
          left = 10,
          right = 10,
          top = 10,
          bottom = 10
        },
        audible_bell = "Disabled",
        window_background_image = "/home/quantinium/wallpapers/wallhaven-3l8lgv_1920x1080.png",
        window_background_image_hsb = {
          hue = 1.0,
          saturation = 1.0,
          brightness = 0.1
        }
      }
    '';
  };
}
