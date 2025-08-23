{inputs, ...}: {
    rust = final: _prev: {
        fenix = import inputs.nixpkgs-unstable {
            system = final.system;
            config.allowUnfree = true;
        };
    };
}
