{config, pkgs, ... }:

{
  # Enable networking
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

}
