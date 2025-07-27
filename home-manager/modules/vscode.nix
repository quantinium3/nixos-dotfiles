{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [

      golang.go

      vscodevim.vim

      astro-build.astro-vscode

      ms-vscode.cpptools-extension-pack
      ms-vscode.cpptools

      rust-lang.rust-analyzer

      ms-python.python
      ms-python.pylint
      ms-pyright.pyright

      bbenoist.nix
    ];
  };
}
