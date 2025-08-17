{
  roc_pkgs,
  pkgs-unstable,
  ...
}: {
  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        tinymist = {
          enable = true;
          settings = {
            formatterMode = "typstyle";
          };
        };

        #nil-ls.enable=true;

        nixd.enable = true;

        svelte = {
          enable = true;
          filetypes = [
            "svelte"
          ];
        };

        roc_ls = {
          enable = true;
          package = roc_pkgs.full;
        };

        nim_langserver = {
          enable = true;
        };

        harper_ls = {
          enable = true;
          autostart = true;
          filetypes = [
            "*"
          ];
          settings = {
            dialect = "British";
          };
        };

        emmet_language_server = {
          enable = true;
          extraOptions = {
            init_options = {
              includeLanguages = {
                "javascriptreact" = "html";
                "typescriptreact" = "html";
              };
            };
          };
          settings = {
            filetypes = [
              "css"
              "html"
              "javascriptreact"
              "typescriptreact"
              "svelte"
              "astro"
            ];
          };
        };

        ts_ls.enable = true;

        rust_analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
          extraOptions = {
            diagnostics = {
              enable = true;
            };
          };
        };
      };
    };
    plugins.none-ls = {
      enable = true;
    };
  };
}
