{
  programs.nixvim = {
    plugins.lspsaga = {
      enable = true;
      settings = {
        lightbulb.enable = false;
        implement.enable = false;
        symbolInWinbar.enable = false;
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "sd";
        action = "<cmd>Lspsaga hover_doc<CR>";
      }
      {
        mode = "n";
        key = "sf";
        action = "<cmd>Lspsaga code_action<CR>";
      }
      {
        mode = "n";
        key = "gr";
        action = "<cmd>Lspsaga rename<CR>";
      }
    ];
  };
}
