{ pkgs, ... }: {
  imports = [
    ./zen-browser.nix
  ];

  home.packages = with pkgs; [
    brave
  ];
}
