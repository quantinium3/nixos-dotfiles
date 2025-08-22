{ pkgs, inputs, ... }: {
  imports = [
    inputs.stylix.homeModules.stylix
  ];

  home.packages = with pkgs; [
    _0xproto
    nerd-fonts.jetbrains-mono
    times-newer-roman
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
  };
}
