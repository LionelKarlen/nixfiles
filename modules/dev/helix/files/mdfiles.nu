def main [x: string] {
  glob $"($x)/**/*.md" | each {|u| ($u | split row "/") | last 2 } | where {|u| let folder = $u | first; ($folder == "notes") or ($folder == "personal") or ($folder == "references")} | each {|u| let name = $u | last; $name | split row "." | first | print } | ignore
}
