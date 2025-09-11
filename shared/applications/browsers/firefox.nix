{
  lib,
  config,
  ...
}:
lib.mkIf config.applications.browsers.firefox.enable {
  programs.firefox = {
    enable = true;
  };
}
