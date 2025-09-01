{ config, pkgs, ... }:

{
  programs.eww = {
    enable = true;
    package = pkgs.eww-yuck;
  };

  home.file.".config/eww/eww.yuck".text = ''
    (defwidget clock []
      (box :orientation "h"
           :halign "center"
           :valign "center"
           (label :text "${date '+%H:%M:%S'}" :class "clock")))

    (defwindow main
      :geometry (geometry :x "50%" :y "5%" :width "200px" :height "50px" :anchor "top center")
      :stacking "fg"
      (clock))
  '';

  home.file.".config/eww/eww.scss".text = ''
    .clock {
      font-size: 20px;
      color: #ffffff;
    }
  '';
}
