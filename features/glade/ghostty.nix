{...}: {
  programs.ghostty = {
    enable = true;
    settings = {
      font-family = "Hasklug Nerd Font";
      font-size = 13;
      window-padding-x = 0;
      window-padding-y = 0;
      window-decoration = "none";
      window-padding-balance = true;
      maximize = true;
      cursor-invert-fg-bg = true;
      command = "zsh";
    };
  };
}
