{pkgs, ...}:{
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      yzhang.markdown-all-in-one
      golang.go
      ms-vscode.cpptools-extension-pack
      rust-lang.rust-analyzer
      ms-python.python
      ms-vscode-remote.remote-containers
      ms-azuretools.vscode-docker
      bbenoist.nix
      yoavbls.pretty-ts-errors
    ];
  };
}
