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

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  systemd.user.startServices = "sd-switch";
}
