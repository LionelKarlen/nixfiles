{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      extensions = {
        fzf-native.enable = true;
        ui-select.enable = true;
      };
      keymaps = {
        "<leader>fs" = {
          mode = "n";
          action = "current_buffer_fuzzy_find";
          options = {
            desc = "[S]earch in [f]ile buffer";
          };
        };
        "<leader>z" = {
          mode = "n";
          action = "lsp_document_symbols";
        };
        "<leader>g" = {
          mode = "n";
          action = "live_grep";
        };
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>l";
        action.__raw = ''
          function()
          	require('telescope.builtin').buffers(
          		require('telescope.themes').get_ivy {
          			winblend=1,
          			previewer=false
          		}
          	)
          end
        '';
        options = {
          desc = "[L]ist [f]ile buffers";
        };
      }
      {
        mode = "n";
        key = "<leader>o";
        action.__raw = ''
          function()
          	require('telescope.builtin').find_files(
          		require('telescope.themes').get_ivy {
          			winblend=10,
          			previewer=true
          		}
          	)
          end
        '';
        options = {
          desc = "[O]pen [f]ile";
        };
      }
    ];
  };
}
