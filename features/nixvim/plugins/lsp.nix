{
  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      servers = {
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
        };
      };
    };
    plugins.none-ls = {
      enable = true;
    };
  };
}
