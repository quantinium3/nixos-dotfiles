{pkgs, inputs, ...}: {
  programs.helix = {
    enable = true;
    settings = {
      theme = "varua_transparent";
      keys = {
        normal = {
          "A-," = "goto_previous_buffer";
          "A-." = "goto_next_buffer";
          "A-w" = ":buffer-close";
          "A-/" = "repeat_last_motion";
          g = {
            r = "goto_reference";
            d = "goto_definition";
          };
          "C-p" = "file_picker";
          space = {
            c = {
              a = "code_action";
            };
            r = {
              n = "rename_symbol";
            };
          };
          esc = ["collapse_selection" "keep_primary_selection"];
        };
      };
      editor = {
        bufferline = "multiple";
        true-color = true;
        auto-completion = false;
        completion-replace = true;
        end-of-line-diagnostics = "hint";
        inline-diagnostics = {
          cursor-line = "warning";
        };
        gutters = {
          layout = ["diff" "diagnostics" "line-numbers" "spacer"];
          line-numbers = {
            min-width = 1;
          };
        };
        search = {
          smart-case = true;
          wrap-around = true;
        };
        soft-wrap = {
          enable = true;
          max-indent-retain = 0;
        };
        statusline = {
          left = ["mode" "version-control" "spinner"];
          center = ["file-name"];
          right = ["diagnostics" "selections" "position" "position-percentage" "file-encoding" "file-line-ending" "file-type"];
        };
        line-number = "relative";
        lsp = {
          display-messages = true;
          auto-signature-help = true;
          display-inlay-hints = true;
        };
        indent-guides = {
          render = true;
          character = "╎";
          skip-levels = 1;
        };
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        whitespace = {
          render = "all";
          characters = {
            space = " ";
            nbsp = "⍽";
            nnbsp = "␣";
            tab = "→";
            newline = "⏎";
            tabpad = " ";
          };
        };
      };
    };
    languages = {
      language = [
        {name = "nix"; auto-format = true; formatter = {command = "${pkgs.alejandra}/bin/alejandra";}; language-servers = ["nil-ls" "wakatime-ls"];}
        {name = "rust"; auto-format = true; formatter = {command = "${pkgs.rustfmt}/bin/rustfmt";}; language-servers = ["rust-analyzer" "wakatime-ls"];}
        {name = "html"; auto-format = true; formatter = {command = "${pkgs.deno}/bin/deno"; args = ["fmt" "-" "--ext" "html"];}; language-servers = ["html-ls" "tailwindcss-ls" "wakatime-ls"];}
        {name = "css"; auto-format = true; formatter = {command = "${pkgs.deno}/bin/deno"; args = ["fmt" "-" "--ext" "css"];}; language-servers = ["css-ls" "tailwindcss-ls" "wakatime-ls"];}
        {name = "javascript"; auto-format = true; formatter = {command = "${pkgs.deno}/bin/deno"; args = ["fmt" "-" "--ext" "js"];}; language-servers = ["typescript-ls" "wakatime-ls"];}
        {name = "typescript"; auto-format = true; formatter = {command = "${pkgs.deno}/bin/deno"; args = ["fmt" "-" "--ext" "ts"];}; language-servers = ["typescript-ls" "wakatime-ls"];}
        {name = "svelte"; auto-format = true; formatter = {command = "${pkgs.nodePackages.prettier}/bin/prettier"; args = ["--plugin" "prettier-plugin-svelte" "--parser" "svelte"];}; language-servers = ["svelte-ls" "tailwindcss-ls" "wakatime-ls"];}
        {name = "astro"; auto-format = true; formatter = {command = "${pkgs.nodePackages.prettier}/bin/prettier"; args = ["--plugin" "prettier-plugin-astro" "--parser" "astro"];}; language-servers = ["astro-ls" "tailwindcss-ls" "wakatime-ls"];}
        {name = "jsx"; auto-format = true; formatter = {command = "${pkgs.deno}/bin/deno"; args = ["fmt" "-" "--ext" "jsx"];}; language-servers = ["typescript-ls" "tailwindcss-ls" "wakatime-ls"];}
        {name = "tsx"; auto-format = true; formatter = {command = "${pkgs.deno}/bin/deno"; args = ["fmt" "-" "--ext" "tsx"];}; language-servers = ["typescript-ls" "tailwindcss-ls" "wakatime-ls"];}
        {name = "json"; auto-format = true; formatter = {command = "${pkgs.deno}/bin/deno"; args = ["fmt" "-" "--ext" "json"];}; language-servers = ["wakatime-ls"];}
        {name = "jsonc"; auto-format = true; formatter = {command = "${pkgs.deno}/bin/deno"; args = ["fmt" "-" "--ext" "jsonc"];}; language-servers = ["wakatime-ls"];}
        {name = "toml"; auto-format = true; formatter = {command = "${pkgs.deno}/bin/deno"; args = ["fmt" "-" "--ext" ""];}; language-servers = ["wakatime-ls"];}
        {name = "markdown"; auto-format = true; formatter = {command = "${pkgs.taplo}/bin/taplo"; args = ["format" "-"];}; language-servers = ["markdown-ls" "wakatime-ls"];}
        {name = "zig"; auto-format = true; formatter = {command = "${pkgs.zls}/bin/zls"; args = ["--format"];}; language-servers = ["zls" "wakatime-ls"];}
        {name = "go"; auto-format = true; formatter = {command = "${pkgs.gofumpt}/bin/gofumpt";}; language-servers = ["gopls" "wakatime-ls"];}
      ];
      language-server = {
        "markdown-ls" = {command = "${pkgs.marksman}/bin/marksman";};
        "nil-ls" = {command = "${pkgs.nil}/bin/nil";};
        "rust-analyzer" = {command = "${pkgs.rust-analyzer}/bin/rust-analyzer";};
        "tailwindcss-ls" = {command = "${pkgs.tailwindcss-language-server}/bin/tailwindcss-language-server"; args = ["--stdio"];};
        "html-ls" = {command = "${pkgs.vscode-langservers-extracted}/bin/vscode-html-language-server"; args = ["--stdio"];};
        "css-ls" = {command = "${pkgs.vscode-langservers-extracted}/bin/vscode-css-language-server"; args = ["--stdio"];};
        "typescript-ls" = {command = "${pkgs.typescript-language-server}/bin/typescript-language-server"; args = ["--stdio"];};
        "svelte-ls" = {command = "${pkgs.nodePackages.svelte-language-server}/bin/svelteserver"; args = ["--stdio"];};
        "astro-ls" = {command = "${pkgs.astro-language-server}/bin/astro-ls"; args = ["--stdio"];};
        zls = {command = "${pkgs.zls}/bin/zls";};
        gopls = {command = "${pkgs.gopls}/bin/gopls"; args = ["serve"];};
        "wakatime-ls" = {command = "${inputs.wakatime-ls.packages.${pkgs.system}.default}/bin/wakatime-ls";};
      };
    };
    themes = {
      varua_transparent = {
        "inherits" = "varua";
        "ui.background" = {};
      };
      autumn_night_transparent = {
        "inherits" = "autumn_night";
        "ui.background" = {};
        "type" = {
          "bg" = "none";
          "fg" = "#ffcc00";
        };
        "variable.type" = {
          "bg" = "none";
          "fg" = "#ffffff";
        };
      };
    };
  };
}
