{ config, pkgs, ... }:

{
  #Zram
  zramSwap.enable = true;
  zramSwap.memoryPercent = 140;

  #increase battery life i think
  services = {
     power-profiles-daemon.enable = false;
     thermald.enable = true;
     };

  services.tlp = {
    enable = true;
    settings = {
      
      CPU_SCALING_GOVERNOR_ON_AC = "schedutil";
      CPU_SCALING_GOVERNOR_ON_BAT = "schedutil";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "power";

      RUNTIME_PM_ON_BAT = "auto";
      RUNTIME_PM_ON_AC = "auto";

      INTEL_GPU_NEEDS_ROOT = 1;
      INTEL_GPU_FREQ_ON_BAT = "low";
      INTEL_GPU_FREQ_ON_AC = "medium";


      #tlp always run battery mode so the laptop wont get hot
      TLP_DEFAULT_MODE = "BAT";
      TLP_PERSISTENT_DEFAULT = 1;

      #Optional helps save long term battery health
      START_CHARGE_THRESH_BAT0 = 40; # 40 and below it starts to charge
      STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging
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
