{ config, pkgs, ... }:

{
  programs.eww = {
    enable = true;
    package = pkgs.eww;
  };

  home.file.".config/eww/eww.yuck".text = ''
    ;; Poll current time every second
    (defpoll time :interval "1s" "date '+%H:%M:%S'")

    (defwidget clock []
      (box :orientation "h"
           :halign "center"
           :valign "center"
           (label :text time :class "clock")))

    (defwindow main
      :geometry (geometry :x "50%" :y "5%" :width "200px" :height "50px" :anchor "top center")
      :stacking "fg"
      (clock))
  '';

  home.file.".config/eww/eww.scss".text = ''
    .clock {
      font-size: 20px;
      color: #ffffff;
      font-family: monospace;
    }
  '';

  systemd.user.services."eww-open-main" = {
    Unit = {
      Description = "Open main Eww window";
      After = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.eww}/bin/eww open main";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}

