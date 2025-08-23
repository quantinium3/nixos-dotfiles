{ pkgs, ... }: {
  programs.git = {
    enable = true;
    lfs.enablePureSSHTransfer = true;
    lfs.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gh
    git-lfs-transfer
    git-absorb
    tig
  ];
}
