{ config, pkgs, ... }:
let
  nvidiaPackage = config.boot.kernelPackages.nvidiaPackages.beta;
in
{
  /* environment.systemPackages = with pkgs;
    [
      ffmpeg
      fmt.dev
      cudaPackages.cuda_cudart
      cudatoolkit
      cudaPackages.cudnn
      cudaPackages.cutensor
      libGLU
      libGL
      xorg.libXi
      xorg.libXmu
      freeglut
      xorg.libXext
      xorg.libX11
      xorg.libXv
      xorg.libXrandr
      zlib
      ncurses
      stdenv.cc
      binutils
      uv
    ]; */

  nixpkgs.config.nvidia.acceptLicense = true;

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    package = nvidiaPackage;
    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  /* environment.variables = {
    LD_LIBRARY_PATH = "${nvidiaPackage}/lib";
    CUDA_PATH = "${pkgs.cudatoolkit}";
    EXTRA_LDFLAGS = "-L/lib -L${nvidiaPackage}/lib";
    EXTRA_CCFLAGS = "-I/usr/include";
    CMAKE_PREFIX_PATH = "${pkgs.fmt.dev}:$CMAKE_PREFIX_PATH";
    PKG_CONFIG_PATH = "${pkgs.fmt.dev}/lib/pkgconfig:$PKG_CONFIG_PATH";
  }; */
}
