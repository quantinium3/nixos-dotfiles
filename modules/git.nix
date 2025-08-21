{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "quantinium03"; # configure sops-nix
    userEmail = "quant@quantinium.dev";
    lfs.enablePureSSHTransfer = true;
    lfs.enable = true;

  };

  programs.difftastic = {
    enable = true;
    background = "dark";
  };

  environment.systemPackage = with pkgs; [
    git-lfs-transfer
    git-absorb
    tig
  ];
}
