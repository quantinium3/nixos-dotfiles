{ hostName, ... }: {
  networking.networkmanager.enable = true;
  networking.hostName = hostName;
  networking.useNetworkd = true;
}
