{
  programs.fish = {
    enable = true;
    shellAliases = {
      c = "clear";
      vim="nvim";
      cl="clear";
      battery-health="nix-shell -p acpi --run 'acpi -i'";
      locate="command -v";
      drive-info="sudo smartctl -a";
      birthday="stat -c %w /";
      hms="home-manager switch --flake .";
      nrb="sudo nixos-rebuild switch --flake .";
      lg="lazygit";
      yz="yazi";
    };
  };
}
