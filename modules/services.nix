{
  services = {
    libinput.enable = {
      libinput.touchpad = {
        tapping = true;
        naturalScrolling = true;
      };
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
      system.autoUpgrade.channel = "https://channels.nixos.org/nixos-25.05";
      system.autoUpgrade.dates = "weekly";
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
