{roc_pkgs, ...}: {
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
        emmet_ls = {
          enable = true;
          extraOptions = {
            init_options = {
              jsx = {
                options = {
                  "markup.attributes" = {className = "class";};
                };
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
