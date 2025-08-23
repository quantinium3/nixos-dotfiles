{ pkgs, inputs, ... }: {
  imports = [
    inputs.stylix.homeModules.stylix
  ];

  home.packages = with pkgs; [
    dejavu_fonts
    nerd-fonts.jetbrains-mono
    times-newer-roman
    font-awesome
    powerline-fonts
    montserrat
  ];

  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/github-dark.yaml";

    targets = {
      waybar.enable = false;
      wofi.enable = false;
      hyprland.enable = false;
      hyprlock.enable = false;
    };

    cursor = {
      name = "Bibata-Modern-Ice";
      size = 24;
      package = pkgs.bibata-cursors;
    };

    fonts = {
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };

      monospace = {
        name = "JetBrains Mono";
        package = pkgs.jetbrains-mono;
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
      url = "https://images5.alphacoders.com/130/1304191.jpeg";
      sha256 = "sha256-e/PrwEKWz/VcQSneT4uZ6Sjp9a6zyIvE61dWlyOAtqU=";
    };
  };
}
