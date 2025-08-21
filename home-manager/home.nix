{ user
, homeStateVersion
}: {
  imports = [
    ./modules
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };

  systemd.user.startServices = "sd-switch";
}
