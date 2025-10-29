{ ... }:
{
  programs.nixvim = {
    autoGroups = {
      highlight-yank = {
        clear = true;
      };
    };
    autoCmd = [
      {
        event = [ "TextYankPost" ];
        desc = "Highlight yank test";
        group = "highlight-yank";
        callback.__raw = ''
          function()
          	vim.highlight.on_yank()
          end
        '';
      }
      {
        event = [ "BufEnter" ];
        pattern = [ "COMMIT_EDITMSG" ];
        callback.__raw = ''
          function()
              vim.wo.spell = true
              vim.api.nvim_win_set_cursor(0, {1, 0})
              if vim.fn.getline(1) == "" then
                vim.cmd("startinsert!")
              end
            end
        '';
      }
    ];
    # This section stops netrw from showing up when opening a directory
    extraConfigLua = ''
          vim.cmd('silent! autocmd! FileExplorer *')
      vim.cmd('autocmd VimEnter * ++once silent! autocmd! FileExplorer *')
    '';
  };
}
