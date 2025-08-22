{ user
, stateVersion
, ...
}: {
  imports = [
    ./modules
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = stateVersion;
  };

  systemd.user.startServices = "sd-switch";
}
