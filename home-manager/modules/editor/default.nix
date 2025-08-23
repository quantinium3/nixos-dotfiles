{ pkgs, ... }: {
  imports = [
    ./zed.nix
    ./nixvim.nix
  ];
  home.packages = with pkgs; [
    code-cursor
  ];
}
