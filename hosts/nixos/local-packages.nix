{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gcc
    gnumake
    cmake
    xorg.libX11
    # jetbrains.pycharm-professional
    # jre8
    # qemu
    # quickemu
  ];
}
