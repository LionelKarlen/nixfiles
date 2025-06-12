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
        tinymist.enable = true;
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
        emmet_language_server = {
          enable = true;
          settings = {
            filetypes = [
              "css"
              "html"
              "javascriptreact"
              "typescriptreact"
              "svelte"
              "astro"
            ];
            init_options = {
              include_languages = {
                "javascriptreact" = "html";
                "typescriptreact" = "html";
              };
            };
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
