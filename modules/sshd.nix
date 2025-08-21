{ ... }:
let
  port = 2222;
in
{
  programs.mosh = {
    enable = true;
    openFirewall = true;
  };

  services.openssh = {
    enable = true;
    ports = [ port ];
    settings = {
      KbdInteractiveAuthentication = false;
      PasswordAuthentication = false;

      AcceptEnv = "SHELLS COLORTERM";
    };
  };
}
