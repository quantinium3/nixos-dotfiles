{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix/release-25.05";
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixvim, fenix, ... }@inputs:
    let
      system = "x86_64-linux";
      homeStateVersion = "25.05";
      user = "quantinium";
      hosts = [
        { hostname = "nixos"; stateVersion = "25.05"; }
      ];

      makeSystem = { hostname, stateVersion }: nixpkgs.lib.nixosSystem {
        system = system;
        specialArgs = {
          inherit inputs stateVersion hostname user;
        };

        modules = [
          ({ pkgs, ... }: {
            nixpkgs.overlays = [ inputs.fenix.overlays.default ];
            environment.systemPackages = with pkgs; [
              (inputs.fenix.packages.${pkgs.system}.complete.withComponents [
                "cargo"
                "clippy"
                "rust-src"
                "rustc"
                "rustfmt"
              ])
              rust-analyzer-nightly
            ];
          })
          ./hosts/${hostname}/configuration.nix
        ];
      };

    in
    {
      packages.x86_64-linux.default = fenix.packages.x86_64-linux.minimal.toolchain;
      nixosConfigurations = nixpkgs.lib.foldl'
        (configs: host:
          configs // {
            "${host.hostname}" = makeSystem {
              inherit (host) hostname stateVersion;
            };
          })
        { }
        hosts;

      homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {
          inherit inputs homeStateVersion user;
        };

        modules = [
          ./home-manager/home.nix
          nixvim.homeManagerModules.nixvim
        ];
      };
    };
}
