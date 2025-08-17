{pkgs, ...}: {
  programs.zoxide = {
    enable = true;
  };

  programs.zsh.shellAliases = {
    cd = "z";
  };

  home.packages = with pkgs; [
    zoxide
  ];
}
