{lib, ...}:{
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    extraConfig = ''
      font_family      "Fira Code"
      bold_font        auto
      italic_font      auto
      bold_italic_font auto
      font_size 16.0
      font_features FiraCode-Retina +zero +onum
      scrollback_lines 10000
      scrollback_indicator_opacity 1.0
      scrollback_pager less --chop-long-lines --RAW-CONTROL-CHARS +INPUT_LINE_NUMBER
      url_color #0087bd
      url_style curly
      open_url_with default
      detect_urls yes
      show_hyperlink_targets no
      underline_hyperlinks hover
      draw_minimal_borders yes
      window_margin_width 1.0
      window_padding_width 10.0
      # active_border_color #00ff00
      # inactive_border_color #cccccc
      # bell_border_color #ff5a00
      # inactive_text_alpha 1.0
      # hide_window_decorations no
      #: Color scheme {{{
      foreground #dddddd
      background #000000
      background_opacity 0.1
      background_blur 1
      background_image ~/wallpapers/frieren_winter_fire.png
      # background_image_layout tiled
      # background_image_linear no
      # dynamic_background_opacity no
      selection_foreground #000000
      selection_background #fffacd
      # color0 #000000
      # color8 #767676
      #: black
      # color1 #cc0403
      # color9 #f2201f
      #: red
      # color2  #19cb00
      # color10 #23fd00
      #: green
      # color3  #cecb00
      # color11 #fffd00
      #: yellow
      # color4  #0d73cc
      # color12 #1a8fff
      #: blue
      # color5  #cb1ed1
      # color13 #fd28ff
      #: magenta
      # color6  #0dcdcd
      # color14 #14ffff
      #: cyan
      # color7  #dddddd
      # color15 #ffffff
      #: white
      # mark1_foreground black
      #: Color for marks of type 1
      # mark1_background #98d3cb
      #: Color for marks of type 1 (light steel blue)
      # mark2_foreground black
      #: Color for marks of type 2
      # mark2_background #f2dcd3
      #: Color for marks of type 1 (beige)
      # mark3_foreground black
      #: Color for marks of type 3
      # mark3_background #f274bc
      #: Color for marks of type 3 (violet)
      term xterm-256color
    '';
  };
}
