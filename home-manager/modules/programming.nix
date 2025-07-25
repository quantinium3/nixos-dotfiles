{ pkgs, ... }: {
  home.packages = with pkgs; [
    # editor
    #vim
    evil-helix
    jetbrains.idea-ultimate
    jetbrains.rust-rover
    jetbrains.goland
    jetbrains.webstorm
    /* jetbrains.pycharm-professional
    jetbrains.clion */
    
    # Terminal 
/*     kitty */


    # lsps
    eslint
    eslint_d
    prettierd
    jdt-language-server
    astro-language-server
    tailwindcss-language-server
    gopls
    pyright
    lua-language-server
    svelte-language-server

    # package managers
    python312Packages.pip
    luarocks
    pnpm

    #database
    sqlite
    sqlite-interactive 
    termdbms
    litecli
    postgresql
    mysql84
    
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

    # Curl wrapper
    bruno
    httpie
    httpie-desktop
/*     postman */
  ];
}
