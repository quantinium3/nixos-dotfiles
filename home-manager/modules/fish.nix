{ config, lib, pkgs, utils, ... }:
{
  programs.fish = {
    enable = true;
    generateCompletions = true;
#    plugins = [
#       {
#          name = "z";
#          src = pkgs.fetchFromGitHub {
#            owner = "jethrokuan";
#            repo = "z";
#            rev = "ddeb28a7b6a1f0ec6dae40c636e5ca4908ad160a";
#            sha256 = "0c5i7sdrsp0q3vbziqzdyqn4fmp235ax4mn4zslrswvn8g3fvdyh";
#          };
#       }
#       {
#         name = "autopair";
#         src = pkgs.fetchFromGitHub {
#           owner = "jorgebucaran";
#           repo = "autopair.fish";
#           rev = "1.0.4";
#           sha256 = "sha256-s1o188TlwpUQEN3X5MxUlD/2CFCpEkWu83U9O+wg3VU=";
#         };
#       }
#       {
#         name = "grc";
#         src = pkgs.fetchFromGitHub {
#           owner = "oh-my-fish";
#           repo = "plugin-grc";
#           rev = "61de7a8a0d7bda3234f8703d6e07c671992eb079";
#           sha256 = "sha256-NQa12L0zlEz2EJjMDhWUhw5cz/zcFokjuCK5ZofTn+Q=";
#         };
#       }
#       {
#         name = "tide";
#         src = pkgs.fetchFromGitHub {
#           owner = "IlanCosman";
#           repo = "tide";
#           rev = "6.1.1";
#           hash = "sha256-ZyEk/WoxdX5Fr2kXRERQS1U1QHH3oVSyBQvlwYnEYyc=";
#         };
#       }
#    ];
  };
  programs.fzf.enableFishIntegration = false;
}
