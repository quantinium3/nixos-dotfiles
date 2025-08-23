{ config, stateVersion, ... }: {
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
    settings = {
      auto-optimise-store = true;
      substituters = [
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "${config.age.secrets.nix_community_cachix_key1.path}"
      ];
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}
