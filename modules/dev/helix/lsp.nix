{ inputs, ... }:
{
  den.aspects.helix = {
    homeManager =
      { pkgs, ... }:
      {
        nixpkgs.overlays = [
          inputs.self.overlays.default
        ];

        home.packages = with pkgs; [
          nixd
          markdown-oxide
          harper
          emmet-language-server
          biome
          local.cria
          local.maudfmt
        ];
        programs.helix.settings.editor.lsp = {
          display-inlay-hints = true;
        };
        programs.helix.languages = {
          grammar = [
            {
              name = "maud";
              source = {
                git = "https://github.com/jjx-lab/tree-sitter-maud.git";
                rev = "d8cb8559f961b80d175cc268ca52fdb95af55775";
              };
            }
          ];
          language = [
            {
              name = "maud";
              scope = "source.maud";
              formatter.command = "maudfmt -s";
              file-types = [ ];
            }
            {
              name = "cpp";
              auto-format = true;
            }
            {
              name = "rust";
              auto-format = true;
              formatter = {
                command = "bash";
                args = [
                  "-c"
                  # fix edition to 2024 here. explicit editions can be set in rustfmt.toml
                  "maudfmt -s | rustfmt --edition 2024"
                ];
              };
            }
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
                "markdown-oxide"
                "harper-ls"
              ];
            }
            {
              name = "html";
              auto-format = true;
              language-servers = [
                "emmet-lsp"
              ];
            }
            {
              name = "tsx";
              auto-format = true;
              language-servers = [
                {
                  name = "typescript-language-server";
                  except-features = [ "format" ];
                }
                "biome"
                "emmet-lsp"
              ];
            }
            {
              name = "typescript";
              auto-format = true;
              language-servers = [
                {
                  name = "typescript-language-server";
                  except-features = [ "format" ];
                }
                "biome"
              ];
            }
            {
              name = "json";
              auto-format = false;
              language-servers = [
                "biome"
              ];
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
              auto-format = true;
              formatter = {
                command = "cria";
                args = [
                  "format"
                  "--stdio"
                ];
              };
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
            biome = {
              command = "biome";
              args = [ "lsp-proxy" ];
            };
            nixd = {
              command = "nixd";
            };
            harper-ls = {
              command = "harper-ls";
              args = [ "--stdio" ];
              config = {
                harper-ls = {
                  dialect = "British";
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
      };

  };
}
