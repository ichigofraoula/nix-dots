{ config, pkgs, ... }:
{
  # Disable documentation
  documentation = {
    enable = false;
    man.enable = false;
    doc.enable = false;
    info.enable = false;
  };

  # Auto garbage-collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 4d";
  };

  # Store optimisation
  nix.settings = {
    auto-optimise-store = true;
    log-lines = 0;
  };
}
