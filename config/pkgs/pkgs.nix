 { pkgs, ... }: 
 
 {
     programs.firefox.enable = false;

     #Make fish the default shell
     programs.fish.enable = true;
     users.defaultUserShell = pkgs.fish;
   
     # Enable running of non-nix apps
     programs.nix-ld.enable = true;
   
     programs.starship.enable = true;
     programs.zoxide.enable = true;
   
     programs.gpu-screen-recorder.enable = true;

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
      nil
   
      powertop #battery
      gpu-screen-recorder

      zed-editor
      obsidian
      localsend
      ghostty

      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
   
      gnome-tweaks
      evince #document viewer
      nemo-with-extensions #file viewer
      nautilus # gnome default file manager
      file-roller #unzip
      loupe

      mpv
      celluloid

      tor-browser
    ];
 }
