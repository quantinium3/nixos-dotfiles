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
    nix-ld
    lm_sensors
    dmidecode
  ];
}
