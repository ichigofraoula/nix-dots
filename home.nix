{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home.username = "strize";
  home.homeDirectory = "/home/strize";

  # You should not change this value
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    audacity
    krita
    youtube-music
    google-chrome
   #(pkgs.writeshellapplication
   #{
   #  name = "ns";
   #  runtimeinputs = with pkgs; [
   #    fzf
   #    nix-search-tv
   #  ];
   #  text = builtins.readfile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
   #})
  ];

  nixpkgs.config.allowUnfree = true;

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
