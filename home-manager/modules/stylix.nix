{ pkgs, inputs, ... }: {
  imports = [ inputs.stylix.homeManagerModules.stylix ];

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
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];

  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa-dragon.yaml";

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
