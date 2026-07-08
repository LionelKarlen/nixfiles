default := "switch"

os command=default:
    nix run .#write-flake
    nh os {{command}}

home command=default:
    nix run .#write-flake
    nh home {{command}}

fmt:
    treefmt
