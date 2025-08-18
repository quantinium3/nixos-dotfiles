{
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "quantinium" ];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}
