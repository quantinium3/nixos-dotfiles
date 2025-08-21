{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
    curl
    wget
    less
    nettools
    iproute2
    home-manager
    lm_sensors
    dmidecode
    pkg-config
  ];
}
