{ user, ... }: {
  age.secrets.nix_community_cachix_key1 = {
    file = ../secrets/nix_community_cachix_key1.age;
    owner = user;
    group = user;
  };
}
