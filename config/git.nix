{
  programs.git = {
    enable = true;
    userName = "strize07";
    userEmail = "strizeop@gmail.com";
    signing = {
      key = "YOUR_GPG_KEY_ID";
      signByDefault = true;
    };
    aliases = {
      co = "checkout";
      br = "branch";
      ci = "commit";
      st = "status";
    };
    extraConfig = {
      core.editor = "nvim";
    };
  };
}

