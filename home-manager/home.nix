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

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  systemd.user.startServices = "sd-switch";
}
