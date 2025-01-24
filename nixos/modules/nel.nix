{ config, pkgs, ... }:

let
  nel-binary = pkgs.stdenv.mkDerivation {
    name = "nel";
    version = "testing";
    
    src = pkgs.fetchurl {
      url = "https://github.com/quantinium03/nel/releases/download/testing/nel";
      sha256 = "0dz313rgs3vfkna2w70yz9gs29hqg2j70kqb84whxmfk5kp19l2v"; # Add the hash here
    };
    
    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [
      pkgs.xorg.libX11
      pkgs.openssl
      pkgs.pkg-config
      pkgs.gcc-unwrapped
    ];
    
    unpackPhase = "true";
    
    installPhase = ''
      mkdir -p $out/bin
      cp $src $out/bin/nel
      chmod +x $out/bin/nel
    '';

    runtimeDependencies = [
      pkgs.xorg.libX11
      pkgs.openssl
      pkgs.gcc-unwrapped
    ];
  };

  start-script = pkgs.writeShellScriptBin "start-nel" ''
    # Wait for X server to be ready
    while ! ${pkgs.xorg.xset}/bin/xset q &>/dev/null; do
      sleep 1
    done

    # Wait for network
    until ping -c1 8.8.8.8 >/dev/null 2>&1; do
      echo "Waiting for network..."
      sleep 1
    done

    # Get the current X display
    display=$(${pkgs.xorg.xdpyinfo}/bin/xdpyinfo | grep "name of display" | cut -d: -f2)
    
    # Get the current user's XAUTHORITY
    if [ -z "$XAUTHORITY" ]; then
      export XAUTHORITY="$HOME/.Xauthority"
    fi

    # Export display-related environment variables
    export DISPLAY="$display"
    
    # Run the binary with logging
    exec ${nel-binary}/bin/nel 2>&1 | logger -t nel
  '';
in
{
  systemd.services.nel = {
    description = "Nel Keypress Tracking Service";
    wantedBy = [ "multi-user.target" ];
    after = [ "display-manager.service" "network-online.target" ];
    requires = [ "display-manager.service" ];
    wants = [ "network-online.target" ];

    environment = {
      RUST_BACKTRACE = "1";
    };

    serviceConfig = {
      Type = "simple";
      User = "quantinium";  # Replace with your actual username
      Group = "users";
      ExecStart = "${start-script}/bin/start-nel";
      Restart = "always";
      RestartSec = "10";
      
      SupplementaryGroups = [ "video" "input" "networkmanager" ];
      RuntimeDirectory = "nel";
      RuntimeDirectoryMode = "0755";
      
      # Add logging
      StandardOutput = "journal";
      StandardError = "journal";
    };
  };

  environment.systemPackages = [ nel-binary ];

  services.xserver.displayManager.sessionCommands = ''
    ${pkgs.xorg.xhost}/bin/xhost +SI:nixos:quantinium
  '';

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [5000 80 443];  # Add your VPS port if needed
    allowedUDPPorts = [];  # Add your VPS port if needed
  };
}
