{ pkgs, ... }:
{
  programs.helix.extraPackages = with pkgs; [
    nixd
    marksman
    harper
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
      {
        name = "markdown";
        language-servers = [
          "marksman"
          "harper-ls"
        ];
      }
    ];

    language-server = {
      nixd = {
        command = "nixd";
      };
      harper-ls = {
        command = "harper-ls";
        args = [ "--stdio" ];
        config = {
          harper-ls = {
            linters = {
              long_sentences = false;
            };
          };
        };
      };
    };
  };
}
