{
  lib,
  config,
  ...
}:
lib.mkIf config.applications.browsers.zen.enable {
  programs.zen-browser.enable = true;
}
