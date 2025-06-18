{pkgs, ...}: {
  home.packages = with pkgs; [
    pass
    pinentry-tty
  ];
  programs.gpg = {
    enable = true;
    settings = {
      use-agent = true;
      pinentry-mode = "loopback";
    };
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    pinentryPackage = pkgs.pinentry-tty;
  };
  programs.zsh = {
    initExtra = ''
      export GPG_TTY=$(tty)
    '';
  };
}
