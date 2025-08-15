{ lib, ... }: {
  programs.alacritty = {
    enable = false;
    settings = {
      window.opacity = 1.0;

      font = {
        builtin_box_drawing = true;
        normal = {
          style = lib.mkForce "Bold";
        };
      };
    };
  };
}
