{ inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../modules
    inputs.home-manager.nixosModules.default
  ];

  home-manager.backupFileExtension = "backup";
  nix.settings.experimental-features = [ "nix-command" "flakes" "pipe-operators" ];
}
