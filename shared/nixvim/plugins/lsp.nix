{ ... }:
{
  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        dartls.enable = true;

        tinymist = {
          enable = true;
          settings = {
            formatterMode = "typstyle";
          };
        };

        nixd.enable = true;

        svelte = {
          enable = true;
          filetypes = [
            "svelte"
          ];
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
      };
    };
    plugins.none-ls = {
      enable = true;
    };
  };
}
