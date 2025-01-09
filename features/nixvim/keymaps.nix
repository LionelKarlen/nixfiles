{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>p";
        action = "<cmd>pu<CR>";
      }
      {
        mode = "n";
        key = "<C-u>";
        action = "<C-u>zz";
      }
      {
        mode = "n";
        key = "<C-d>";
        action = "<C-d>zz";
      }
      {
        mode = "n";
        key = "<leader>fp";
        action = "<cmd>bprev<CR>";
        options = {
          desc = "[P]revious [f]ile buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>fn";
        action = "<cmd>bnext<CR>";
        options = {
          desc = "[N]ext [f]ile buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>bnext<CR>";
        options = {
          desc = "[F]orward [f]ile buffer";
        };
      }
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w><C-h>";
        options = {
          desc = "Move focus to the left window";
        };
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w><C-l>";
        options = {
          desc = "Move focus to the right window";
        };
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w><C-j>";
        options = {
          desc = "Move focus to the lower window";
        };
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w><C-k>";
        options = {
          desc = "Move focus to the upper window";
        };
      }
    ];
  };
}
