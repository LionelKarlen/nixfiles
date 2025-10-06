{ ... }:
{
  programs.helix.settings.keys = {
    normal = {
      ";" = ":w";
      "," = [
        "collapse_selection"
        "keep_primary_selection"
      ];
      "space" = {
        "o" = "file_picker";
        "l" = "buffer_picker";
      };
      "Z" = {
        "Z" = ":q";
      };
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
