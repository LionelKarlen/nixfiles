{
  programs.nixvim = {
    plugins.trouble = {
      enable = true;
      settings = {
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>xt";
        action = "<cmd>Trouble todo<CR>";
      }
      {
        mode = "n";
        key = "<leader>xd";
        action = "<cmd>Trouble diagnostics<CR>";
      }
    ];
  };
}
