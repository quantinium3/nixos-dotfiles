{ config, ... }:
{
  editor.defaultAlias = "hx";

  home-manager.sharedModules = [{
    programs.helix = {
      enable = true;

      languages.language = config.editor.languageConfigsHelix;
      languages.language-server = config.editor.lspConfigsHelix;

      settings.theme = "gruvbox_dark_hard";

      settings.editor = {
        auto-completion = false;
        bufferline = "multiple";
        color-modes = true;
        cursorline = true;
        file-picker.hidden = false;
        idle-timeout = 0;
        shell = [ "nu" "--commands" ];
        text-width = 100;
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
        render.tab = "all";
      };
    };
  }];
}
