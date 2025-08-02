{config, pkgs, ... }:

{
  #enable bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
}
