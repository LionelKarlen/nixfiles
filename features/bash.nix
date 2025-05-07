{config, ...}: {
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[>](bold green)";
        error_symbol = "[>](bold red)";
      };
      hostname = {
        disabled = true;
      };
    };
  };
  programs.bash = {
    enable = true;
    shellAliases = {
      la = "ls -a";
      hms = "home-manager switch --flake /home/$(whoami)/.$(hostname)/";
      nrb = "nixos-rebuild switch --flake /home/$(whoami)/.$(hostname)/";
      e = "$EDITOR";
      c = "$EDITOR";
    };
  };
}
