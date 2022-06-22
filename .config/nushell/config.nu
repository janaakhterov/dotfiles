let-env LS_COLORS = (vivid generate molokai)
let-env HELIX_RUNTIME = $"($env.HOME)/repos/github.com/helix-editor/helix/runtime"

source ~/.cache/starship/init.nu

alias g = (cd (build-string ((open ~/.config/grm.config.yaml).trees.root.0) "/" ((open ~/.config/grm.config.yaml).trees.repos.0 | select name | to csv -n | fzf | str trim)))
alias h = (history | select command | to csv -n | fzf | str trim)
alias gs = (git status)
