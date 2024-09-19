{
  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      servers = {
        #nil-ls.enable=true;
        tsserver.enable = true;
        nixd.enable = true;
        svelte.enable = true;
        rust-analyzer = {
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
