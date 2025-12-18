{ config, pkgs, ... }:

{
  #Zram
  zramSwap = {
    enable = true;
    priority = 100;
    algorithm = "lz4";
    memoryPercent = 75;
  };

  #controls fan to keep temp low
  services.mbpfan.enable = true;

  #increase battery life i think
  services = {
    power-profiles-daemon.enable = false;
    thermald.enable = true;
    upower.enable = true;
  };

  services.tlp = {
    enable = true;
    settings = {
      # CPU
      CPU_SCALING_GOVERNOR_ON_AC = "schedutil";
      CPU_SCALING_GOVERNOR_ON_BAT = "schedutil";
      CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance"; # AC: decent perf
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power"; # BAT: low power

      # Intel GPU
      INTEL_GPU_MIN_FREQ_ON_AC = 300;
      INTEL_GPU_MAX_FREQ_ON_AC = 800;
      INTEL_GPU_BOOST_FREQ_ON_AC = 800;
      INTEL_GPU_MIN_FREQ_ON_BAT = 300;
      INTEL_GPU_MAX_FREQ_ON_BAT = 400;
      INTEL_GPU_BOOST_FREQ_ON_BAT = 400;

      # Runtime PM
      RUNTIME_PM_ON_AC = "auto";
      RUNTIME_PM_ON_BAT = "auto";

      # Sound
      SOUND_POWER_SAVE_ON_BAT = 1;
      SOUND_POWER_SAVE_CONTROLLER = "Y";

      # Wi-Fi
      WIFI_PWR_ON_AC = "auto";
      WIFI_PWR_ON_BAT = "auto";

      # Force TLP to always enforce BAT mode settings (good for heat)
      TLP_DEFAULT_MODE = "BAT";
      TLP_PERSISTENT_DEFAULT = 1;

      # Charge thresholds (ignored on your MacBook, safe to leave)
      START_CHARGE_THRESH_BAT0 = 40;
      STOP_CHARGE_THRESH_BAT0 = 80;
    };
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      libvdpau-va-gl
    ];
  };
}
