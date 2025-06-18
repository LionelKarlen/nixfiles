{
  programs.nixvim = {
    plugins.autoclose = {
      enable = true;
      settings = {
        keys = {
          "<" = {
            escape = false;
            close = true;
            pair = "<>";
          };
          "(" = {
            escape = false;
            close = true;
            pair = "()";
          };
          "[" = {
            escape = false;
            close = true;
            pair = "[]";
          };
          "{" = {
            escape = false;
            close = true;
            pair = "{}";
          };
          "'" = {
            escape = false;
            close = true;
            pair = "''";
            disabled_filetypes = [
              "rust"
              "typst"
              "markdown"
              "text"
              ""
            ];
          };
          "$" = {
            escape = false;
            close = true;
            pair = "$$";
            enabled_filetypes = ["typst"];
          };
        };
        options = {
          disabledFiletypes = null;
          autoIndent = true;
        };
      };
    };
  };
}
