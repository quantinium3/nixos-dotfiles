{ pkgs, inputs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
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
    nomacs-qt6
    htop
    btop
    libreoffice-fresh
    figma-linux
    qbittorrent
    telegram-desktop
    bitwarden-desktop
    gimp
    kdePackages.okular
    pavucontrol
    notion-app-enhanced
    slack
    qalculate-qt
    ncspot
    yazi

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
    uutils-coreutils

    # WM
    libsForQt5.xwaylandvideobridge
    libnotify
    xdg-desktop-portal-gtk
    hyprsunset
    xdg-desktop-portal-hyprland

    # Miscellaneous
    bemoji
    nix-prefetch-scripts
    dmenu
    rofi
    grc
    ripgrep
    flameshot
    steam-run
    davinci-resolve-studio
    rmpc
    mpd
    mpc
    tokei
    kdePackages.kgpg
    gnupg
    pinentry-all
  ];

}
