{
  programs.nixvim = {
    plugins.lean = {
      enable = true;
    };
    plugins.lsp = {
      servers = {
        leanls.enable = true;
      };
    };
  };
}
