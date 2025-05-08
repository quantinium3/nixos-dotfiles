{
  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 38;
        modules-left = [ "hyprland/workspaces" ];
        modules-right = [ "tray" "hyprland/language" "custom/weather" "backlight" "pulseaudio" "battery" "temperature" "memory" "cpu" "clock" ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          warp-on-scroll = false;
          format = "";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "6" = "";
            "7" = "";
            "8" = "";
            "9" = "";
            "10" = "";
            "urgent" = "";
            "magic" = "";
          };

          persistent-workspaces = {
            "*" = 10;
          };
        };

        "custom/weather" = {
          format = " {} ";
          exec = "curl -s 'https://wttr.in/Delhi?format=%c%t'";
          interval = 300;
          class = "weather";
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-bluetooth = "{icon} {volume}% ";
          format-muted = "";
          format-icons = {
            "headphones" = "";
            "handsfree" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [ "" "" ];
          };
          on-click = "pavucontrol";
        };

        "cpu" = {
          format = "{usage}%";
          tooltip = true;
        };

        "backlight" = {
          device = "intel_backlight";
          format = "{percent}% {icon}";
          format-icons = [ "" "" ];
        };

        "memory" = {
          format = "{}% ";
          tooltip = true;
          interval = 5;
          states = {
            warning = 70;
            critical = 90;
          };
        };

        "temperature" = {
          interval = 10;
          tooltip = true;
          hwmon-path = "/sys/devices/virtual/thermal/thermal_zone7/temp";
          critical-threshold = 80;
          format-critical = "󰸁 {temperatureC}°C";
          format = "󰔏 {temperatureC}°C";
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 1;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-alt = "{time} {icon}";
          format-icons = [ "" "" "" "" "" ];
        };

        "clock" = {
          format = "{:%d.%m.%Y - %H:%M}";
          format-alt = "{:%A, %B %d at %R}";
        };

        "tray" = {
          icon-size = 14;
          spacing = 1;
        };
      };
    };
  };
}
