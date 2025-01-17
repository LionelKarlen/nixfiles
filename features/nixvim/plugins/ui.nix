{pkgs, ...}: {
  programs.nixvim = {
    plugins.lualine.enable = true;
    plugins.web-devicons.enable = true;
    plugins.bufferline = {
      enable = true;
      settings = {
        options = {
          offsets = [
            {
              filetype = "neo-tree";
              text = "File Explorer";
              highlight = "Directory";
              text_align = "left";
            }
          ];
        };
      };
    };
    extraPlugins = [
      pkgs.vimPlugins."vim-bbye"
    ];
    keymaps = [
      {
        mode = "n";
        key = "<leader>fd";
        action = "<cmd>Bdelete<CR>";
        options = {
          desc = "[D]elete [f]ile buffer";
        };
      }
    ];
  };
}
