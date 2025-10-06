{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf config.programming.nim.enable {
  home.packages = with pkgs; [
    nim
    nimble
    nimlangserver
  ];

  programs.nixvim.plugins.lsp.servers.nim_langserver = {
    enable = true;
  };
}
