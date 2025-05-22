{
  programs.rmpc = {
    enable = true;
  };

  home.file.".config/rmpc/config.ron".source = ./config.ron;
}
