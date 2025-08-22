{ hostname, ... }: {
  networking.networkmanager.enable = true;
  networking.hostName = hostname;
  networking.useNetworkd = true;
}
