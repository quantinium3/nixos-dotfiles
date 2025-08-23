{ user
, stateVersion
, ...
}: {
  imports = [
    ./modules
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = stateVersion;
  };

  systemd.user.startServices = "sd-switch";
}
