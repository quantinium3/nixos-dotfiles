{pkgs, ...}:{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    extraConfig = lib.fileContents ../path/to/your/init.vim;
  };
}
