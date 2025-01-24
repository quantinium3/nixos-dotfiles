{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Packages in each category are sorted alphabetically
    vim

    # Desktop apps
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
    yt-dlp
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
    rustup
    lua51Packages.lua
    luarocks
    bruno
    lua-language-server
    clang-tools
    pyright

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
  ];
}
