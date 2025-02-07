{ pkgs, ... }: {
  programs = {
    idea-ultimate = {
      enable = true;
      package = pkgs.jetbrains.idea-ultimate;
    };
    webstorm = {
      enable = true;
      package = pkgs.jetbrains.webstorm;
    };
    clion = {
      enable = true;
      package = pkgs.jetbrains.clion;
    };
    pycharm-professional = {
      enable = true;
      package = pkgs.jetbrains.pycharm-professional;
    };
    goland = {
      enable = true;
      package = pkgs.jetbrains.goland;
    };
  };
}
