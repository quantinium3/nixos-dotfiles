{
  programs.fish = {
    enable = true;
    shellAliases = {
      c = "clear";
      vim="nvim";
      cl="clear";
      opent="alacritty &";
      update="sudo pacman -Syyu";
      battery-health="upower -i /org/freedesktop/UPower/devices/battery_BAT0";
      locate="command -v";
      drive-info="sudo smartctl -a";
      birthday="stat -c %w /";
      hms="home-manager switch --flake .";
      nrb="sudo nixos-rebuild switch --flake .";
    };
  };
}
