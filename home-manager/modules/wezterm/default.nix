{
    programs.wezterm = {
        enable = true;
        enableBashIntegration = true;
        extraConfig = builtins.readFile ./wezterm.lua;
    };
}
