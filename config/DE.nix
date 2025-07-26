{config, pkgs, ... }:

{

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.gnome.core-apps.enable = false;
  environment.gnome.excludePackages = with pkgs.gnome; [
   pkgs.gnome-tour
  ];

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true; #GTK app compatability
    extraPackages = with pkgs; [
      swaylock #Lockscreen
      swayidle #idle management
      wl-clipboard #clipboard
      mako # notification
      grim #SS tool
      slurp # region selection for SS
      wofi #app launcher
      foot #lightweight terminal
    ];
  };
  
  #required for sway
  security.polkit.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "colemak";
  };
}
