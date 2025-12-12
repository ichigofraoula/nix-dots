programs.waybar.enable = true;
programs.waybar.extraConfig = ''
{
  "layer": "top",
  "position": "top",
  "modules-left": ["sway/workspaces"],
  "modules-center": ["clock"],
  "modules-right": ["network", "pulseaudio", "battery", "backlight", "keyboard_layout"]
}
'';

programs.waybar.extraStyle = ''
* {
  font-family: "Monospace";
  font-size: 12px;
  background: #222;
  color: #eee;
}
'';

