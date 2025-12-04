{
  lib,
  config,
  ...
}:
lib.mkIf config.applications.terminals.ghostty.enable {
  programs.ghostty = {
    enable = true;
    clearDefaultKeybinds = true;
    settings = {
      font-family = "BlexMono Nerd Font";
      font-size = 13;
      window-padding-x = 0;
      window-padding-y = 0;
      window-decoration = "none";
      window-padding-balance = true;
      maximize = true;
      cursor-invert-fg-bg = true;
      clipboard-read = "allow";
      clipboard-write = "allow";
      command = "zsh";
      keybind = [
        "ctrl+shift+v=paste_from_clipboard"
        "ctrl+shift+c=copy_to_clipboard"
      ];
    };
  };
}
