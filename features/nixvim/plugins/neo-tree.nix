{
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;
      window.position = "right";
      filesystem = {
        window = {
          mappings = {
            "<leader>e" = "close_window";
          };
        };
        filteredItems = {
          hideDotfiles = false;
          hideByName = [
            ".git"
          ];
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
