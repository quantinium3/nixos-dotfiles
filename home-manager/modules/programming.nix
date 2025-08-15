{ pkgs, ... }: {
  home.packages = with pkgs; [
    # editor
    #vim
    helix
    jetbrains.idea-ultimate
    jetbrains.rust-rover
    jetbrains.goland
    jetbrains.webstorm
    /* jetbrains.pycharm-professional
    jetbrains.clion */
    clang
    clang-tools

    # package managers
    python312Packages.pip
    luarocks
    pnpm


    eslint
    eslint_d
    prettierd
    #database
    sqlite
    sqlite-interactive
    termdbms
    litecli
    postgresql
    mysql84
    cargo-generate

    # Tools
    gh
    git-lfs
    jujutsu
    tmux-sessionizer
    hyperfine

    # Languages
    nodejs
    python311
    go
    gnumake
    jdk
    cmake
    lua51Packages.lua
    clang-tools
    bun
    racket
    ghc
    weka
    texliveFull
    gradle
    zig
    crystal
    dmd
    go
    groovy
    ghc
    julia
    nix
    odin
    perl
    ruby
    rustc
    scala
    bfc
    R
    clang

    # Curl wrapper
    bruno
    insomnia
    httpie
    httpie-desktop
    deploy-rs

    matlab-language-server
    deno
    nodePackages_latest."@angular/cli"
    httpyac
    air
  ];
}
