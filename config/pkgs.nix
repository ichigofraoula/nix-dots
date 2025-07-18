 {config, pkgs, ... }: 
 
 {
     programs.firefox.enable = true;

     #Make fish the default shell
     programs.fish.enable = true;
     users.defaultUserShell = pkgs.fish;
   
     # Enable running of non-nix apps
     programs.nix-ld.enable = true;
   
     programs.starship.enable = true;
     programs.zoxide.enable = true;
   
     programs.yazi.enable = true;

     environment.systemPackages = with pkgs; [
      wget
      git
      neovim
      lazygit
      eza
      fzf
      bat
      btop
      fastfetch
      gcc
   
      powertop

      audacity
      zed-editor
      obsidian
      kitty
      ghostty
      youtube-music

      glance
      localsend
   
      gnome-tweaks
      evince
      nemo
      file-roller
      stacer
   
      kooha
      mpv
      celluloid
    ];
 }
