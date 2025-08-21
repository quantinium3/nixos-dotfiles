{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    home-manager
    openssl
    pkg-config
    wireguard-tools
    vipsdisp
    vips
    lm_sensors
    dmidecode
  ];
}
