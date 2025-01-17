{pkgs, ...}: {
  imports = [
    ./plugins/autoclose.nix
    ./plugins/neo-tree.nix
    ./plugins/nvim-cmp.nix
    ./plugins/ui.nix
    ./plugins/telescope.nix
    ./plugins/mini.nix
    ./plugins/treesitter.nix
    ./plugins/lsp.nix
    ./plugins/conform.nix
    ./plugins/gitsigns.nix
    ./plugins/surround.nix
    ./plugins/trouble.nix
  ];

  programs.nixvim = {
    plugins = {
      hardtime = {
        enable = true;
      };
      sleuth = {
        enable = true;
      };
      comment = {
        enable = true;
        settings = {
          toggler.line = "<leader>/";
          opleader = {
            line = "<leader>/";
          };
        };
      };
      todo-comments = {
        enable = true;
        settings = {
          signs = true;
        };
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      nvim-web-devicons
    ];
  };
}
