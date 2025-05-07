{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      return {
        color_scheme = "Catppuccin Mocha",
        colors = {
          -- Override the foreground color (optional, for all text)
          foreground = "#cdd6f4", -- Catppuccin Mocha's default text color (light grey, more visible)
          -- Override ANSI colors to make grey (used for directories) brighter
          ansi = {
            "#1e1e2e", -- black (ansi[1])
            "#f38ba8", -- red
            "#a6e3a1", -- green
            "#f9e2af", -- yellow
            "#89b4fa", -- blue
            "#f5c2e7", -- magenta
            "#94e2d5", -- cyan
            "#b4befe"  -- white (replacing dim grey #6c7086 with Mocha's lavender for directories)
          },
          brights = {
            "#45475a", -- bright black
            "#f38ba8", -- bright red
            "#a6e3a1", -- bright green
            "#f9e2af", -- bright yellow
            "#89b4fa", -- bright blue
            "#f5c2e7", -- bright magenta
            "#94e2d5", -- bright cyan
            "#ffffff"  -- bright white
          }
        },
        font = wezterm.font "Fira Code",
        font_size = 16.0,
        line_height = 1.0,
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
