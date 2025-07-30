{ pkgs, ... }: {
  home.packages = with pkgs; [
    astro-language-server
    pyright
    lua-language-server
    asm-lsp
    bash-language-server
    cmake-language-server
    docker-language-server
    docker-compose-language-service
    elixir-ls
    erlang-ls
    nixd
    jdt-language-server
    markdown-oxide
    ocamlPackages.lsp
    python312Packages.python-lsp-server
    basedpyright
    pylyzer
    racket
    tailwindcss-language-server
    texlab
    vscode-langservers-extracted
    yaml-language-server
    fish-lsp
    zls
    svelte-language-server
    rust-analyzer
  ];

}
