{ ... }:
{
  programs.nixvim = {
    plugins.harpoon = {
      enable = true;
      autoLoad = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<M-a>";
        action.__raw = ''
          function() require("harpoon"):list():add() end
        '';
      }

      {
        mode = "n";
        key = "<M-s>";
        action.__raw = ''
          function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end
        '';
      }

      {
        mode = "n";
        key = "<M-h>";
        action.__raw = ''
          function() require("harpoon"):list():select(1) end
        '';
      }

      {
        mode = "n";
        key = "<M-j>";
        action.__raw = ''
          function() require("harpoon"):list():select(2) end
        '';
      }

      {
        mode = "n";
        key = "<M-k>";
        action.__raw = ''
          function() require("harpoon"):list():select(3) end
        '';
      }

      {
        mode = "n";
        key = "<M-l>";
        action.__raw = ''
          function() require("harpoon"):list():select(4) end
        '';
      }
    ];
  };
}
