{ pkgs, ... }:
{
  programs.helix.extraPackages = with pkgs; [
    nixd
    dart
  ];
  programs.helix.languages = {
    language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
      }
      {
        name = "dart";
        auto-format = true;
      }
    ];

    language-server = {
      nixd = {
        command = "nixd";
      };
    };
  };
}
