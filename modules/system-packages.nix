{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
    curlHTTP3
    wget
    less
    nettools
    iproute2
    home-manager
    lm_sensors
    dmidecode
    pkg-config
    wl-clipboard
    inputs.agenix.packages."${system}".default
  ];
}
