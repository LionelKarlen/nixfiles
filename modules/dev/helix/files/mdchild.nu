def write_child_template [parent_name: string, path: string] {
  let template = $"---\ntags: [atomic]\nup: \"[[($parent_name)]]\"\n---\n\n"
  $template | save $path
}

def main [parent: string, child: string] {
  let parent_parts = $parent | split row "/"
  let parent_name = ($parent_parts | last) | split row "." | drop 1 | str join ""
  let parent_dir = ($parent_parts | drop 1) | str join "/"
  let path = $"($parent_dir)/($child).md"
  write_child_template $parent_name $path
  $path | print -n
}
