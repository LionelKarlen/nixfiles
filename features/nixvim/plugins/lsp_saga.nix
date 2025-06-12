{
  programs.nixvim = {
    plugins.lspsaga = {
      enable = true;
      lightbulb.enable = false;
      implement.enable = false;
      symbolInWinbar.enable = false;
    };
    keymaps = [
      {
        mode = "n";
        key = "gd";
        action = "<cmd>Lspsaga hover_doc<CR>";
      }
      {
        mode = "n";
        key = "gf";
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
