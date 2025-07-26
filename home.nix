{ config, pkgs, inputs, ... }:

{
  home.username = "strize";
  home.homeDirectory = "/home/strize";

  # You should not change this value 
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
  ];

  home.file = {
  };

  imports = [
   inputs.zen-browser.homeModules.beta
   #inputs.zen-browser.homeModules.twilight
   #inputs.zen-browser.homeModules.twilight-official
  ];

  programs.zen-browser.enable = true;

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
