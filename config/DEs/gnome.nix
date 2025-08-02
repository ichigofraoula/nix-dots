{config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    gnome.core-apps.enable = false;
  };

  environment.gnome.excludePackages = with pkgs.gnome; [
   pkgs.gnome-tour
  ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "qwerty";
  };
}
