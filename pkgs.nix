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
   
     #make neovim the default
     programs.neovim.enable = true;
     programs.neovim.defaultEditor = true;

     programs.yazi.enable = true;

     environment.systemPackages = with pkgs; [
      wget
      vim
      git
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
