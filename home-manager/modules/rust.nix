{ pkgs, rust-overlay, ... }: {
  nixpkgs.overlays = [ rust-overlay.overlays.default ];

  home.packages = with pkgs; [
    (rust-bin.nightly.latest.default.override {
      extensions = [ "rust-src" "rust-analyzer" "clippy" "rustfmt" "miri" ];
    })
  ];
}
