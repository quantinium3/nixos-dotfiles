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
      hddtemp.enable = true;
    };

    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      prime = {
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
      };
    };
  };

  services.xserver.videoDrivers = [
    "modesetting"
    "nvidia"
  ];
}









