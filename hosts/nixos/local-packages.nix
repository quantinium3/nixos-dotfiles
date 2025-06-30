{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gcc
    gnumake
    cmake
    xorg.libX11
    openssl
    pkg-config
    wireguard-tools
    vipsdisp
    vips
    lm_sensors
    dmidecode
    sshfs-fuse
    sshfs
    fuse
  ];
}
