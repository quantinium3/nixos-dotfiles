{ pkgs
, user
, ...
}: {
  users = {
    defaultUserShell = pkgs.fish;
    users.${user} = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "docker" ];
    };
  };

  services.getty.autologinUser = user;
}
