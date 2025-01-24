{
  environment.sessionVariables = rec {
    TERMINAL = "alacritty";
    EDITOR = "nvim";
    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = [
      "${XDG_BIN_HOME}"
    ];
    OPENSSL_DIR = "/nix/store/l6b0m26ck97ajyapz7nkwvyxqqhxmhbp-openssl-3.3.2-bin/bin/openssl
";
  };
}
