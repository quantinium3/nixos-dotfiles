{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
    curl
    wget
    less
    nettools
    iproute2
    openssh
    home-manager
    lm_sensors
    dmidecode
    pkg-config
  ];
}
