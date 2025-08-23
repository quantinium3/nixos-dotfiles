{ stateVersion, ... }: {
  environment.variables = rec {
    EDITOR = "nvim";
    TERMINAL = "wezterm";
    PAGER = "less";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = [
      "${XDG_BIN_HOME}"
    ];
  };

  time.timeZone = "Asia/Kolkata";

  system = {
    stateVersion = stateVersion;
    rebuild.enableNg = true;
  };

  nix = {
    settings.auto-optimise-store = true;
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}
