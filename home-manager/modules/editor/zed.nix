{ pkgs, ... }: {
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;
    extensions = [ ];
    userKeymaps = [
      {
        context = "Editor && vim_mode == normal";
        bindings = {
          "space e" = "workspace::ToggleLeftDock";
          "ctrl-/" = "workspace::ToggleBottomDock";
          "space f" = "editor::Format";
          "space s f" = "file_finder::Toggle";
          "shift-l" = "pane::ActivateNextItem";
          "shift-h" = "pane::ActivatePreviousItem";
          "space v" = "pane::SplitRight";
          "space w" = "pane::CloseActiveItem";
          "space h" = "workspace::ActivateNextPane";
          "space l" = "workspace::ActivatePreviousPane";
          "g e" = "editor::GoToDiagnostic";
          "g E" = "editor::GoToPreviousDiagnostic";
          "g d" = "editor::GoToDefinition";
          "g D" = "editor::GoToTypeDefinitionSplit";
          "g r" = "editor::FindAllReferences";
        };
      }
      {
        context = "ProjectPanel && not_editing";
        bindings = {
          h = "project_panel::CollapseSelectedEntry";
          l = "project_panel::ExpandSelectedEntry";
          j = "menu::SelectNext";
          k = "menu::SelectPrevious";
          o = "menu::Confirm";
          r = "project_panel::Rename";
          "z c" = "project_panel::CollapseSelectedEntry";
          "z o" = "project_panel::ExpandSelectedEntry";
          x = "project_panel::Cut";
          c = "project_panel::Copy";
          p = "project_panel::Paste";
          d = "project_panel::Delete";
          a = "project_panel::NewFile";
          "shift-a" = "project_panel::NewDirectory";
          "shift-y" = "workspace::CopyRelativePath";
          "g y" = "workspace::CopyPath";
        };
      }
    ];
    userSettings = {
      vim_mode = true;
      relative_line_numbers = true;
      show_edit_predictions = false;
      show_completions_on_input = false;
      features = {
        edit_prediction_provider = "zed";
      };
      /* agent = {
        default_model = {
          provider = "anthropic";
          model = "claude-3-7-sonnet-latest";
        };
        model_parameters = [];
        default_profile = "ask";
        version = "2";
      }; */
      telemetry = {
        metrics = false;
        diagnostics = false;
      };
      soft_wrap = "editor_width";
      tab_size = 2;
      hard_tabs = true;
      show_whitespaces = "all";
      show_wrap_guides = true;
      show_completion_documentation = true;
      diagnostics = {
        button = true;
        include_warnings = true;
        inline = {
          enabled = true;
          update_debounce_ms = 150;
          padding = 2;
          min_column = 1;
          max_severity = null;
        };
        cargo = null;
      };
      git = {
        git_gutter = "tracked_files";
        gutter_debounce = null;
        inline_blame = {
          enabled = true;
        };
        hunk_style = "unstaged_hollow";
      };
      indent_guides = {
        enabled = true;
        line_width = 1;
        active_line_width = 2;
        coloring = "fixed";
        background_coloring = "disabled";
      };
      inlay_hints = {
        enabled = true;
        show_type_hints = true;
        show_parameter_hints = true;
        show_other_hints = true;
        show_background = false;
        edit_debounce_ms = 700;
        scroll_debounce_ms = 50;
      };
      lsp = {
        "rust-analyzer" = {
          binary = {
            path = "rust-analyzer";
          };
          initialization_options = {
            inlayHints = {
              maxLength = null;
              lifetimeElisionHints = {
                enable = "skip_trivial";
                useParameterNames = true;
              };
              closureReturnTypeHints = {
                enable = "always";
              };
            };
          };
        };
        vtsls = {
          settings = {
            typescript = {
              tsserver = {
                maxTsServerMemory = 16184;
              };
              inlayHints = {
                parameterNames = {
                  enabled = "all";
                  suppressWhenArgumentMatchesName = false;
                };
                parameterTypes = {
                  enabled = true;
                };
                variableTypes = {
                  enabled = true;
                  suppressWhenTypeMatchesName = true;
                };
                propertyDeclarationTypes = {
                  enabled = true;
                };
                functionLikeReturnTypes = {
                  enabled = true;
                };
                enumMemberValues = {
                  enabled = true;
                };
              };
            };
            javascript = {
              tsserver = {
                maxTsServerMemory = 16184;
              };
              inlayHints = {
                parameterNames = {
                  enabled = "all";
                  suppressWhenArgumentMatchesName = false;
                };
                parameterTypes = {
                  enabled = true;
                };
                variableTypes = {
                  enabled = true;
                  suppressWhenTypeMatchesName = true;
                };
                propertyDeclarationTypes = {
                  enabled = true;
                };
                functionLikeReturnTypes = {
                  enabled = true;
                };
                enumMemberValues = {
                  enabled = true;
                };
              };
            };
          };
        };
        eslint = {
          settings = {
            problems = {
              shortenToSingleLine = true;
            };
            codeActionOnSave = {
              rules = [ "simple-import-sort/imports" ];
            };
          };
          initialization_options = {
            rulesCustomizations = [
              {
                rule = "simple-import-sort/imports";
                severity = "error";
              }
            ];
          };
        };
      };
      languages = {
        JavaScript = {
          format_on_save = "on";
          code_actions_on_format = {
            "source.fixAll.eslint" = true;
          };
        };
        TypeScript = {
          format_on_save = "on";
          code_actions_on_format = {
            "source.fixAll.eslint" = true;
          };
        };
        TSX = {
          format_on_save = "on";
          code_actions_on_format = {
            "source.fixAll.eslint" = true;
          };
        };
        Nix = {
          format_on_save = "on";
          formatter = {
            external = {
              command = "${pkgs.alejandra}/bin/alejandra";
              arguments = [ ];
            };
          };
        };
      };
      current_line_highlight = "gutter";
      scrollbar = {
        show = "auto";
        cursors = true;
        git_diff = true;
        search_results = true;
        selected_symbols = true;
        diagnostics = "all";
        axes = {
          horizontal = true;
          vertical = true;
        };
      };
      enable_language_server = true;
      ensure_final_newline_on_save = true;
      use_autoclose = false;
      hour_format = "hour24";
    };
  };

  programs.zed-editor-extensions = {
    enable = true;
    packages = with pkgs.zed-extensions; [
      nix
      wakatime
      toml
      dockerfile
      sql
      make
      latex
      svelte
      scss
      lua
      xml
      astro
      zig
      log
      emmet
      prisma
      env
      ini
      golangci-lint
      go-snippets
      gruvbox-baby
      vhdl
      elixir
      basher
      discord-presence
      http
      proto
    ];
  };
}
