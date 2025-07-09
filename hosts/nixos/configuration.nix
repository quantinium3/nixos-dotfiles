{ config, lib, pkgs, stateVersion, hostname, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./local-packages.nix
      ../../nixos/modules
    ];

  networking.hostName = hostname;
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  /* networking.firewall = {
    allowedUDPPorts = [ 51820 ];
    };
    networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "10.0.0.2/8" ];
      listenPort = 51820;

      privateKey = "YKjgbMOrkRZopK0abnoBtBskQAklQgWO7baAT2HedHI=";

      peers = [

        {
          publicKey = "piE56JKHAWqv4R7JAaaWSFJ+9du90iSD6V8b15I5Xks=";

          allowedIPs = [ "0.0.0.0/0" ];
          endpoint = "64.227.172.31:51820"; # ToDo: route to endpoint not automatically configured https://wiki.archlinux.org/index.php/WireGuard#Loop_routing https://discourse.nixos.org/t/solved-minimal-firewall-setup-for-wireguard-client/7577

          persistentKeepalive = 25;
        }
      ];
    };
  }; */

  services.xserver = {
    enable = true;
    windowManager.awesome = {
      enable = true;
      luaModules = with pkgs.luaPackages; [
        luarocks
        luadbi-mysql
      ];
    };
    displayManager.gdm.enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
    videoDrivers = [ "nvidia" ];
  };
  powerManagement.enable = true;
  powerManagement.powerUpCommands = ''
    echo disk > /sys/power/state
  '';

  services.libinput.touchpad.tapping = true;
  services.libinput.touchpad.naturalScrolling = true;
  services.libinput.enable = true;
  services.ollama = {
    enable = true;
    loadModels = [ "gemma3" ];
  };

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-unwrapped"
    "steam-run"
  ];

  services.flatpak.enable = true;
  services.smartd = {
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

  system.stateVersion = stateVersion;
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;
  system.autoUpgrade.channel = "https://channels.nixos.org/nixos-25.05";
  system.autoUpgrade.dates = "weekly";

  systemd.user.services.nel = {
    description = "Nel Input Tracker";
    wantedBy = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "/home/quantinium/personal/github/nel/target/release/nel";
      Restart = "on-failure";
      Environment = "DISPLAY=:0";
    };
  };

  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 10d";
  nix.settings.auto-optimise-store = true;
  programs.fuse.userAllowOther = true;

  environment.systemPackages = [ pkgs.home-manager ];

  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs; [
    intel-compute-runtime
    intel-media-driver
    libva-utils
  ];
  hardware.sensor.iio.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false; # not neoveau
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    /* # Optimus prime
      prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    }; */
  };
}

