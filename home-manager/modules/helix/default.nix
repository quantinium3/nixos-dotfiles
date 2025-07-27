{ config, lib, pkgs, ... }: let
  inherit (lib) attrValues mkIf mkValue mapAttrs optionalAttrs elem;
in {
  options.editor.languageConfigsHelix = mkValue (let
    formattedLanguages = {
      astro      = "astro";
      css        = "css";
      html       = "html";
      javascript = "js";
      json       = "json";
      jsonc      = "jsonc";
      jsx        = "jsx";
      markdown   = "md";
      scss       = "scss";
      svelte     = "svelte";
      tsx        = "tsx";
      typescript = "ts";
      vue        = "vue";
      yaml       = "yaml";
      tailwind   = "tailwindcss";
    }
    |> mapAttrs (name: extension: {
      inherit name;

      auto-format       = true;
      formatter.command = "deno";
      formatter.args    = [ "fmt" "--unstable-component" "--ext" extension "-" ];
    } // optionalAttrs (elem name [ "javascript" "jsx" "typescript" "tsx" ]) {
      language-servers = [ "deno" ];
    })
    |> attrValues;
  in formattedLanguages ++ [
    {
      name              = "nix";
      auto-format       = false;
      formatter.command = "nixfmt";
    }

    {
      name             = "python";
      auto-format      = true;
      language-servers = [ "basedpyright" ];
    }

    {
      name        = "toml";
      auto-format = true;
    }

    {
      name = "rust";

      debugger.name      = "lldb-dap";
      debugger.transport = "stdio";
      debugger.command   = "lldb-dap";

      debugger.templates = [{
        name    = "binary";
        request = "launch";

        completion = [{
          name = "binary";
          completion = "filename";
        }];

        args.program      = "{0}";
        args.initCommands = let
          writeText = pkgs.writeText;

          primer = writeText "primer.py" ''
            import subprocess
            import pathlib
            import lldb

            # Not hardcoding a nix store path here on purpose.
            rustlib_etc = pathlib.Path(subprocess.getoutput("rustc --print sysroot")) / "lib" / "rustlib" / "etc"
            if not rustlib_etc.exists():
                raise RuntimeError("Unable to determine rustc sysroot")

            # Load lldb_lookup.py and execute lldb_commands with the correct path
            lldb.debugger.HandleCommand(f"""command script import "{rustlib_etc / 'lldb_lookup.py'}" """)
            lldb.debugger.HandleCommand(f"""command source -s 0 "{rustlib_etc / 'lldb_commands'}" """)
          '';
        in [ "command script import ${primer}/primer.py" ];
      }];
    }
  ]);

  options.editor.lspConfigsHelix = mkValue {
    deno = {
      command = "deno";
      args    = [ "lsp" ];

      environment.NO_COLOR = "1";

      config.javascript = {
        lint     = true;
        unstable = true;

        suggest.imports.hosts."https://deno.land" = true;

        inlayHints.enumMemberValues.enabled         = true;
        inlayHints.functionLikeReturnTypes.enabled  = true;
        inlayHints.parameterNames.enabled           = "all";
        inlayHints.parameterTypes.enabled           = true;
        inlayHints.propertyDeclarationTypes.enabled = true;
        inlayHints.variableTypes.enabled            = true;
      };
    };

    rust-analyzer = {
      config = {
        cargo.features               = "all";
        check.command                = "clippy";
        completion.callable.snippets = "add_parentheses";
        completion.excludeTraits     = [ "yansi::Paint" ];
        diagnostics.disabled         = [ "inactive-code" "unlinked-file" ];
      };
    };
  };

  config.environment = {
    shellAliases.e   = config.editor.defaultAlias;
    variables.EDITOR = config.editor.defaultAlias;

    systemPackages = mkIf config.isDesktop [
      pkgs.cmake-language-server
      pkgs.gopls
      pkgs.vscode-langservers-extracted
      pkgs.lua-language-server
      pkgs.markdown-oxide
      pkgs.nixfmt-rfc-style
      pkgs.nixd
      pkgs.basedpyright
      pkgs.rust-analyzer-nightly
      pkgs.lldb
      pkgs.deno
      pkgs.yaml-language-server
      pkgs.zls
    ];
  };
}
