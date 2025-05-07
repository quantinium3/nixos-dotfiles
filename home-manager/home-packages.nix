{ pkgs, inputs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Packages in each category are sorted alphabetically
    vim
    times-newer-roman

    # Desktop apps
    nautilus
    ventoy-full
    xfce.thunar
    obs-studio
    obsidian
    discord
    ungoogled-chromium
    firefox
    tor-browser
    postman
    lsd
    timg
    ffmpeg
    anki-bin
    spotdl
    vlc
    gwenview
    jdk
    jdt-language-server
    astro-language-server
    eslint
    eslint_d
    prettierd
    tailwindcss-language-server

    # CLI utils
    brightnessctl
    cliphist
    fzf
    git-graph
    grimblast
    htop
    fastfetch
    playerctl
    ripgrep
    udisks
    ueberzugpp
    unzip
    wget
    wl-clipboard
    wtype
    zip
    xclip
    flameshot
    btop
    tmux-sessionizer
    gh
    python312Packages.pip

    # Coding stuff
    nodejs
    python311
    go
    gnumake
    cmake
    gopls
    lua51Packages.lua
    luarocks
    bruno
    lua-language-server
    clang-tools
    pyright
    bun
    nodePackages.serve
    racket
    ghc

    # WM stuff
    libsForQt5.xwaylandvideobridge
    libnotify
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland

    # Other
    bemoji
    nix-prefetch-scripts

    # awesome
    dmenu
    kitty
    rofi
    grc
    swaybg

    # jetbrains tools
    jetbrains.idea-ultimate
    jetbrains.webstorm
    jetbrains.rust-rover
    jetbrains.clion
    jetbrains.pycharm-professional
    jetbrains.goland
    weka
    pnpm

    texliveFull
    libreoffice-fresh
    figma-linux
    qbittorrent
    telegram-desktop
    git-lfs
    jq
    cloc
    bitwarden-desktop
    nix-index
    lsof
    redshift
    gimp
    betterdiscordctl
    okular
    gradle
    pavucontrol
    notion-app-enhanced
    slack
    cbonsai
  ];

}
