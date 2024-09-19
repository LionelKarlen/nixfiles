{pkgs, ...}: {
  imports = [
    ./plugins/autopair.nix
    ./plugins/neo-tree.nix
    ./plugins/nvim-cmp.nix
    ./plugins/ui.nix
    ./plugins/telescope.nix
    ./plugins/mini.nix
    ./plugins/treesitter.nix
    ./plugins/lsp.nix
    ./plugins/conform.nix
  ];

  programs.nixvim = {
    plugins = {
      sleuth = {
        enable = true;
      };
      comment = {
        enable = true;
        settings = {
          opleader = {
            line = "<leader>/";
          };
        };
      };
      todo-comments = {
        enable = true;
        signs = true;
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      nvim-web-devicons
    ];
  };
}
