{
  services = {
    libinput.enable = true;
    libinput.touchpad = {
      tapping = true;
      naturalScrolling = true;
    };

    smartd = {
      enable = true;
      devices = [
        {
          device = "/dev/nvme0n1";
        }
        {
          device = "/dev/nvme1n1";
        }
      ];
    };
  };

  system = {
    autoUpgrade = {
      enable = true;
      allowReboot = true;
      channel = "https://channels.nixos.org/nixos-25.05";
      dates = "weekly";
    };
  };

  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 10d";
    };
  };
}
