{pkgs, ...}: {
  home.packages = with pkgs; [
    pass
    pinentry-tty
  ];
  programs.gpg = {
    enable = true;
    settings = {
      use-agent = true;
      batch-mode = false;
      pinentry-mode = "ask";
    };
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    pinentry.package = pkgs.pinentry-curses;
  };
  programs.zsh = {
    initContent = ''
      export GPG_TTY=$(tty)
    '';
  };
}
