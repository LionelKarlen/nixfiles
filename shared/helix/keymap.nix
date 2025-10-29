{ ... }:
{
  programs.helix.settings.keys = {
    normal = {
      ";" = ":w";
      "," = [
        "collapse_selection"
        "keep_primary_selection"
      ];
      "g" = {
        "u" = "jump_backward";
      };
      "space" = {
        "o" = "file_picker";
        "l" = "buffer_picker";
      };
      "Z" = {
        "Z" = ":q";
      };
      "{" = "goto_prev_paragraph";
      "}" = "goto_next_paragraph";
      "C-u" = [
        "page_cursor_half_up"
        "align_view_center"
      ];
      "C-d" = [
        "page_cursor_half_down"
        "align_view_center"
      ];
    };
    insert = {
      "C-l" = "completion";
    };
  };
}
