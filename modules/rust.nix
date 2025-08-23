{ pkgs
, rust-overlays
, ...
}: {
  nixpkgs.overlays = [
    rust-overlays.overlays.default
  ];

  environment.systemPackages = with pkgs; [
    rust-bin.stable.latest.default
  ];
}
