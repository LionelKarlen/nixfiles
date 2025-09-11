{
  programs.nixvim = {
    opts = {
      number = true;
      relativenumber = true;
      mouse = "a";
      showmode = false;
      breakindent = true;
      undofile = true;
      ignorecase = true;
      smartcase = true;
      signcolumn = "yes";
      updatetime = 200;
      timeoutlen = 500;
      splitright = true;
      splitbelow = true;

      list = true;
      # NOTE: .__raw here means that this field is raw lua code
      listchars.__raw = "{tab='│ ', trail = '·', nbsp = '␣' }";

      inccommand = "split";

      cursorline = true;
      scrolloff = 10;
      hlsearch = true;
      scroll = 20;

      shiftwidth = 4;
      tabstop = 4;
      softtabstop = 4;
      autoindent = true;
    };
    globals = {
      mapleader = " ";
      maplocalleader = " ";
      have_nerd_font = false;
    };
    colorschemes = {
      base16 = {
        enable = true;
        colorscheme = "atelier-estuary-light";
      };
    };
  };
}
