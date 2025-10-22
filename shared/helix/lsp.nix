{ pkgs, ... }:
{
  programs.helix.extraPackages = with pkgs; [
    nixd
    marksman
    harper
  ];
  programs.helix.settings.editor.lsp = {
    display-inlay-hints = true;
  };
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
      {
        name = "tsx";
        auto-format = true;
      }
      {
        name = "typescript";
        auto-format = true;
      }
      {
        name = "typst";
        auto-format = true;
        formatter.command = "${pkgs.typstyle}/bin/typstyle";
        language-servers = [
          "tinymist"
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
