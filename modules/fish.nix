{
  programs.fish = {
    enable = true;

    shellAbbrs = {
      vim = "nvim";
      battery-health = "nix-shell -p acpi --run 'acpi -i'";
      locate = "find / -name";
      drive-info = "sudo smartctl -a";
      birthday = "stat -c %w /";
      hms = "home-manager switch --flake ~/.config/nix#derivator";
      nrb = "sudo nixos-rebuild switch --flake ~/.config/nix#derivator";
      lg = "lazygit";
      yz = "yazi";
    };

    interactiveShellInit = ''
      set fish_greeting "" 

      function gitignore
        curl -sL https://www.gitignore.io/api/$argv
      end
    '';
  };
}
