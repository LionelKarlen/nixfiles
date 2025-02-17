{
  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        typst_lsp.enable = true;
        #nil-ls.enable=true;
        nixd.enable = true;
        svelte = {
          enable = true;
          filetypes = [
            "svelte"
          ];
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
