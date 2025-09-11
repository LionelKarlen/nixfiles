{ config, lib, ... }:
lib.mkIf config.applications.terminals.kitty.enable {
  programs.kitty = {
    enable = true;
  };
}
