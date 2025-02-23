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

  services.xserver = {
    enable = true;
    windowManager.awesome = {
      enable = true;
      luaModules = with pkgs.luaPackages; [
        luarocks # is the package manager for Lua modules
        luadbi-mysql # Database abstraction layer
      ];
    };
    displayManager.gdm.enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
    # videoDrivers = [ "nvidia" ];
  };
  powerManagement.enable = true;
  powerManagement.powerUpCommands = ''
    echo disk > /sys/power/state
  '';
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      turbo = "never";
    };
    charger = {
      governor = "performance";
      turbo = "auto";
    };
  };

  services.libinput.touchpad.tapping = true;
  services.libinput.touchpad.naturalScrolling = true;
  services.libinput.enable = true;
  /* services.ollama = {
    enable = true;
    loadModels = [ "deepseek-r1:8b" "deepseek-coder-v2:16b" "deepseek-r1:7b" ];
  }; */

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-unwrapped"
    "steam-run"
  ];

  services.flatpak.enable = true;

  system.stateVersion = stateVersion;
  system.autoUpgrade.enable = true;
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

  environment.systemPackages = [ pkgs.home-manager ];

  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs; [
    intel-compute-runtime
    intel-media-driver
    libva-utils
  ];
  /* hardware.nvidia = {
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = true;

    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false; # not neoveau
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # Optimus prime
    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
      # sync more:- https://nixos.wiki/wiki/Nvidia#Optimus_PRIME_Option_B:_Sync_Mode
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    };
  }; */
}

