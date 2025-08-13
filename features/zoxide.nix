{pkgs, ...}: {
  programs.zoxide = {
    enable = true;
  };

  home.packages = with pkgs; [
    zoxide
  ];
}
