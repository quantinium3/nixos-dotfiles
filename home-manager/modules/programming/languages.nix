{ pkgs, ... }: {
  home.packages = with pkgs; [
    # LSP and Linters
    astro-language-server
    lua-language-server
    asm-lsp
    bash-language-server
    cmake-language-server
    docker-language-server
    docker-compose-language-service
    elixir-ls
    erlang-ls
    jdt-language-server
    markdown-oxide
    ocamlPackages.lsp
    python312Packages.python-lsp-server
    basedpyright
    pylyzer
    tailwindcss-language-server
    vscode-langservers-extracted
    yaml-language-server
    fish-lsp
    svelte-language-server
    eslint
    eslint_d
    prettierd
    tinymist
    typstfmt

    # COMPILERS
    python314
    clang_16
    clang-tools_16
    lld
    nodejs_latest
    bun
    deno
    go
    lua51Packages.lua
    ghc
    zig
    odin
    R
    jdk
    ruby
    elixir
    erlang
    nasm
    cmake
    typst

    luarocks
    opencode
  ];
}
