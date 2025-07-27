{ config, lib, pkgs, ... }: let
  inherit (lib) const enabled genAttrs mkAfter mkIf;
in {
  editor.defaultAlias = "hx";

  home-manager.sharedModules = [{
    programs.helix = {
      enable = true;
      languages.language        = config.editor.languageConfigsHelix;
      languages.language-server = config.editor.lspConfigsHelix;

      settings.editor = {
        auto-completion    = false;
        bufferline         = "multiple";
        color-modes        = true;
        cursorline         = true;
        file-picker.hidden = false;
        idle-timeout       = 0;
        text-width         = 100;
      };

      settings.editor.cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };

      settings.editor.statusline.mode = {
        insert = "INSERT";
        normal = "NORMAL";
        select = "SELECT";
      };

      settings.editor.indent-guides = {
        character = "▏";
        render = true;
      };

      settings.editor.whitespace = {
        characters.tab = "→";
        render.tab     = "all";
      };

      settings.keys = genAttrs [ "normal" "select" ] <| const {
        D = "extend_to_line_end";
      };
    };
  }];
}
