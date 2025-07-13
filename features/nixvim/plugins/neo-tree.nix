{
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;
      window.position = "right";
      filesystem = {
        hijackNetrwBehavior = "disabled";
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
      {
        key = "<leader>y";
        action = "<cmd>Yazi<cr>";
      }
    ];
    plugins.yazi = {
      enable = true;
      autoLoad = true;
      lazyLoad.enable = false;
      settings = {
        open_for_directories = false;
      };
    };
  };
}
