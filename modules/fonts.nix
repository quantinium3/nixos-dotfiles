{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-lgc-plus
    noto-fonts-emoji
    noto-fonts-extra
    _0xproto
    nerd-fonts.jetbrains-mono
  ];

  console = {
    earlySetup = true;
    font = "Lat2-Terminus16";
    packages = [ pkgs.terminus_font ];
  };
}
