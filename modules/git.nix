{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "quantinium03"; #TODO: configure sops-nix
    userEmail = "quant@quantinium.dev";
    lfs.enablePureSSHTransfer = true;
    lfs.enable = true;
  };

  programs.difftastic = {
    enable = true;
    background = "dark";
  };

  environment.systemPackage = with pkgs; [
    gh
    git-lfs-transfer
    git-absorb
    tig
  ];
}
