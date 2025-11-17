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
    store-size-soft-limit = "15G";
  };

  #optimize for garbage collection in nix
  nix.settings.auto-optimise-store = true;

  #Replaces nixos-rebuild completely
  system.rebuild.enableNg = true;

}
