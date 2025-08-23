{ hostname, ... }: {
  networking.networkmanager.enable = true;
  networking.hostName = hostname;
}
