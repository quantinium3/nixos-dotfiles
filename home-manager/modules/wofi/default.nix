{
  programs.wofi = {
    enable = true;
    settings = {
      allow_markup = true;
      allow_images = true;
    };
  };

  home.file.".config/wofi/style.css".source = ./style.css;
}
