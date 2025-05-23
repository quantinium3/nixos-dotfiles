{ pkgs, inputs, ... }: {
  imports = [ inputs.stylix.homeModules.stylix ];

  home.packages = with pkgs; [
    dejavu_fonts
    noto-fonts
    noto-fonts-emoji
    font-awesome
    powerline-fonts
    times-newer-roman
    powerline-symbols
    montserrat
    _0xproto
  ];

  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = {
      base00 = "#0d0c0c";
      base01 = "#1D1C19";
      base02 = "#282727";
      base03 = "#737c73";
      base04 = "#a6a69c";
      base05 = "#c5c9c5";
      base06 = "#7a8382";
      base07 = "#c5c9c5";
      base08 = "#c4746e";
      base09 = "#b98d7b";
      base0A = "#c4b28a";
      base0B = "#87a987";
      base0C = "#8ea4a2";
      base0D = "#8ba4b0";
      base0E = "#8992a7";
      base0F = "#a292a3";
    };

    targets = {
      waybar.enable = false;
      wofi.enable = false;
      hyprland.enable = false;
      hyprlock.enable = false;
    };

    cursor = {
      name = "DMZ-Black";
      size = 24;
      package = pkgs.vanilla-dmz;
    };

    fonts = {
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };
      monospace = {
        name = "0xProto";
        package = pkgs._0xproto;
      };
      sansSerif = {
        name = "Montserrat";
        package = pkgs.montserrat;
      };
      serif = {
        name = "Noto Serif";
        package = pkgs.noto-fonts;
      };

      sizes = {
        terminal = 16;
        applications = 11;
      };
    };

    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };

    image = pkgs.fetchurl {
      url = "https://w.wallhaven.cc/full/qr/wallhaven-qr9987.jpg";
      sha256 = "sha256-xKBv8ve65GeY/PkCGBQZwtHQS1FZL4QpVcLnG8qLH5Q=";
    };
  };
}
