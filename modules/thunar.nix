{ pkgs, ... }: {
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      xfce.thunar-archive-plugin
      xfce.thunar-media-tags-plugin
      xfce.thunar-volman
    ];
  };

  environment.systemPackages = with pkgs; [
    kdePackages.ark
    ffmpegthumbnailer
    libgsf
    xfce.tumbler
  ];
}
