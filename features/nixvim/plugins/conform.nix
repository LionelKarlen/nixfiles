{pkgs, ...}: {
  programs.nixvim = {
    extraPackages = with pkgs; [
      stylua
      alejandra
    ];
    plugins.conform-nvim = {
      enable = true;
      settings = {
        log_level = "off";
        format_on_save = {
          lsp_format = "fallback";
          quiet = true;
          stop_after_first = true;
          timeout_ms = 500;
        };
        notify_on_error = false;
        notify_no_formatters = false;
        formatters_by_ft = {
          lua = ["stylua"];
          javascript = ["prettier"];
          nix = ["alejandra"];
          "_" = ["prettier"];
        };
      };
    };

    keymaps = [
      {
        mode = "";
        key = "<leader>i";
        action.__raw = ''
          function()
            require('conform').format({ async = true, lsp_fallback = true })
          end
        '';
        options = {
          desc = "Format buffer";
        };
      }
    ];
  };
}
