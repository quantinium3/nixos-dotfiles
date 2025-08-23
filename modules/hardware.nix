{ pkgs, config, ... }: {
  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-compute-runtime
        intel-media-driver
        libva-utils
      ];
    };
    sensor = {
      iio.enable = true;
      hddtemp = {
        enable = true;
        drives = [
          "/dev/nvme0n1"
          "/dev/nvme1n1"
        ];
      };
    };

    enableRedistributableFirmware = true;
    steam-hardware.enable = true;
  };

  services.xserver = {
    videoDrivers = [
      "nvidia"
    ];
    displayManager.gdm.enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };
}









