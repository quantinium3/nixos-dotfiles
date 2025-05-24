{ pkgs, ... }: {
  home.packages = with pkgs; [
    # editor
    #vim
    evil-helix
    jetbrains.idea-ultimate
    /* jetbrains.webstorm
    jetbrains.rust-rover
    jetbrains.clion
    jetbrains.pycharm-professional
    jetbrains.goland */
    
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
/*     postman */
  ];
}
