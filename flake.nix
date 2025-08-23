{
  description = "quantinium's nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wakatime-ls = {
      url = "github:mrnossiom/wakatime-ls";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zed-extensions = {
      url = "github:DuskSystems/nix-zed-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };


  outputs = { self, nixpkgs, home-manager, rust-overlay, nixvim, wakatime-ls, zed-extensions, zen-browser, ... }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      stateVersion = "25.05";
      hostname = "derivator";
      user = "quantinium";
    in
    {
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        system = system;
        specialArgs = {
          inherit inputs stateVersion hostname user;
        };
        modules = [
          ./nixos/configuration.nix
        ];
      };

      overlays = import ./overlays { inherit inputs; };

      homeConfigurations.${hostname} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = { inherit inputs outputs user stateVersion rust-overlay; };
        modules = [
          ./home-manager/home.nix
          nixvim.homeManagerModules.nixvim
          zed-extensions.homeManagerModules.default
          zen-browser.homeModules.twilight
        ];
      };
    };

}
