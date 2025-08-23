{ pkgs, ... }: {
  home.packages = with pkgs; [
    httpyac    
    air
    deploy-rs
    hyperfine
    turbo
  ];
}
