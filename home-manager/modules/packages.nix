{ pkgs, ... }: {
  home.packages = with pkgs; [
    asciinema
    dig
    doggo
    fastfetch
    fd
    jc
    moreutils
    openssl
    p7zip
    pstree
    rsync
    sd
    timg
    tokei
    typos
    uutils-coreutils-noprefix
    xh
    yt-dlp
    (fortune.override { withOffensive = true; })
    traceroute
    usbutils
    strace

    haruna
    thunderbird
    whatsapp-for-linux
    element-desktop
    fractal
    obs-studio
    libreoffice
    qbittorrent
    lmstudio
  ];
}
