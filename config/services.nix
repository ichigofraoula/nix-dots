{config, pkgs, ... }:

{
  #enable bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };


  # Enable networking
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  # Enable CUPS to print documents.
  services.printing.enable = false;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true; # If you want to use JACK applications, uncomment this
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput = {
    enable = true;
    touchpad = {
      tapping = true;
      scrollMethod = "twofinger";
      naturalScrolling = true;
    };
  };
}
