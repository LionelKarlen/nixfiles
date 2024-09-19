{
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;
      filesystem = {
        window = {
          mappings = {
            "<leader>e" = "close_window";
          };
        };
      };
    };
    keymaps = [
      {
        key = "<leader>e";
        action = "<cmd>Neotree reveal<cr>";
        options = {
          desc = "NeoTree reveal";
        };
      }
    ];
  };
}
