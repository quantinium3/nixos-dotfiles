{ pkgs, inputs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Tools
    ventoy-full

    # Applications
    xfce.thunar
    obs-studio
    obsidian
    discord
    ungoogled-chromium
    firefox
    tor-browser
    anki-bin
    vlc
    gwenview
    htop
    btop
    libreoffice-fresh
    figma-linux
    qbittorrent
    telegram-desktop
    bitwarden-desktop
    gimp
    okular
    pavucontrol
    notion-app-enhanced
    slack
    qalculate-qt

    # CLI Tools
    lsd
    timg
    ffmpeg
    brightnessctl
    cliphist
    fzf
    grimblast
    unzip
    wget
    wl-clipboard
    wtype
    zip
    udisks
    xclip
    jq
    cloc
    nix-index
    lsof
    redshift
    cbonsai
    fastfetch
    grim

    # WM
    libsForQt5.xwaylandvideobridge
    libnotify
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland

    # Miscellaneous
    bemoji
    nix-prefetch-scripts
    dmenu
    rofi
    grc
    ripgrep
  ];

}
