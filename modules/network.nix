{ hostName, ... }: {
  networking.networkmanager.enable = true;
  networking.hostName = hostName;
}
