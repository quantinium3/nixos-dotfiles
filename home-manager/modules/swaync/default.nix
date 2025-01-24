{
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      control-center-radius = 1;
      fit-to-screen = true;
      layer-shell = true;
      layer = "overlay";
      control-center-layer = "overlay";
      cssPriority = "user";
      notification-icon-size = 64;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      timeout = 10;
      timeout-low = 5;
      timeout-critical = 0;

      widgets = [
        "inhibitors"
        "dnd"
        "mpris"
        "notifications"
      ];
      widget-config = {
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "Clear All";
        };
        dnd = {
          text = "Do Not Disturb";
        };
        mpris = {
          image-size = 96;
          blur = true;
        };
      };
    };
  };
}
