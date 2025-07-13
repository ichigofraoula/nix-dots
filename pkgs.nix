 {config, pkgs, ... }: 
 
 {
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
      tmux
      eza
      rmpc
      fzf
      fastfetch
   
      powertop
   
      audacity
      zed-editor
      obsidian
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
