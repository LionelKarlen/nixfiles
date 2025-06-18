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
        key = "<leader>st";
        action = "<cmd>Trouble todo toggle<CR>";
      }
      {
        mode = "n";
        key = "<leader>se";
        action = "<cmd>Trouble diagnostics toggle<CR>";
      }
    ];
  };
}
