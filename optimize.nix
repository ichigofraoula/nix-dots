{ config, pkgs, ... }:

{
  #Zram
  zramSwap.enable = true;
  zramSwap.memoryPercent = 120;

  #increase battery life i think
  services = {
     power-profiles-daemon.enable = false;
     thermald.enable = true;
     };

  services.tlp = {
    enable = true;
    settings = {
    };
  };

  #starts at boot
  systemd.services.powertop-autotune = {
    description = "Powertop auto-tune";
    serviceConfig = {
      ExecStart = "${pkgs.powertop}/bin/powertop --auto-tune";
      Type = "oneshot";
    };
  };

  #run every 30min to save battery
  systemd.timers.powertop-autotune = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "5min";
      OnUnitActiveSec = "30min";
      Unit = "powertop-autotune.service";
    };
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
     intel-media-driver
     vaapiIntel
     vaapiVdpau
     libvdpau-va-gl
    ];
  };

  # Enable nix flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  #Replaces nixos-rebuild completely
  system.rebuild.enableNg = true;

  #optimize for garbage collection in nix
  nix.settings.auto-optimise-store = true;

  # Purge unused nix store entries
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 4d";
  };
}
