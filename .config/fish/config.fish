# Vi mode
fish_vi_key_bindings

# Clear greeting
set fish_greeting

# Environment Variables
set -x EDITOR vim

# Vim
abbr -a vims    "vim -S Session.vim"
abbr -a vimjava "vim src/**/*.(java|proto|groovy) gen/**/*.java examples/**/*.java"
abbr -a vimjs   "vim src/**/*.(js|ts|vue|json) *.(js|json|ts) test*/**/*.(js|ts)"

# ls
abbr -a ls "exa"
abbr -a la "ls -a"
abbr -a ll "ls -l"

# Git
abbr -a gs   "git status"
abbr -a gp   "git pull"
abbr -a ga   "git add -A"
abbr -a gc   "git commit"
abbr -a gcm  "git commit -m"
abbr -a gcam "git commit -am"
abbr -a gd   "git diff"
abbr -a gds  "git diff --staged"
abbr -a gba  "git branch -a"

abbr pings "ping 8.8.8.8"

# Cargo
abbr -a cmt "cargo make test"
abbr -a cm  "cargo make"
abbr -a cc  "cargo check"

# Yadm
abbr -a ys   "yadm status"
abbr -a yp   "yadm pull"
abbr -a ya   "yadm add -A"
abbr -a yc   "yadm commit"
abbr -a ycm  "yadm commit -m"
abbr -a ycam "yadm commit -am"
abbr -a yd   "yadm diff"
abbr -a yds  "yadm diff --staged"
abbr -a yba  "yadm branch -a"
