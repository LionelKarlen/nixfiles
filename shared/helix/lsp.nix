{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixd
    marksman
    harper
    emmet-language-server
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
        language-servers = [
          "typescript-language-server"
          "emmet-lsp"
        ];
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
      {
        name = "todotxt";
        auto-format = false;
        block-comment-tokens = [
          {
            start = "x";
            end = "";
          }
          {
            start = ".";
            end = "";
          }
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
      emmet-lsp = {
        command = "emmet-language-server";
        args = [ "--stdio" ];
        config = {
          includeLanguages = {
            "javascriptreact" = "html";
            "typescriptreact" = "html";
          };
        };
      };
    };
  };
}
