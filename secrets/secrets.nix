let
  system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE2w9KO956anOnvShcGIb+A3LaYTHFkEBFNFL77Ba1MK quant@quantinium.dev";
in
{
  "nix_community_cachix_key1.age".publicKeys = [ system ];
}
