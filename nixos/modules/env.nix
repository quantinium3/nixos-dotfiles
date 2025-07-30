{ pkgs, ... }: {
  environment.sessionVariables = rec {
    TERMINAL = "wezterm";
    EDITOR = "hx";
    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = [
      "${XDG_BIN_HOME}"
    ];
    OPENSSL_DIR = "${pkgs.openssl.bin}/bin/openssl";
  };
}

