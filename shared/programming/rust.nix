{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf config.programming.rust.enable {
  home.packages = with pkgs; [
    rustup
    bacon
  ];

  programs.nixvim.plugins.lsp.servers.rust_analyzer = {
    enable = true;
    installCargo = false;
    installRustc = false;
    extraOptions = {
      diagnostics = {
        enable = true;
      };
    };
  };
}
