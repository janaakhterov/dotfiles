#!/usr/bin/env bash

if ! command -v ghq &> /dev/null; then
    echo "`ghq` is not installed"
    exit
fi

GHQ_ROOT=$(ghq root)

if tmux info &> /dev/null; then 
    echo "`tmux` is already running"
    exit
fi

COLS=$(tput cols)
LINES=$(tput lines)

# Java
tmux new-session -s java -d -x $COLS -y $LINES -c $GHQ_ROOT/github.com/hashgraph/sdk/java/v1 -n 'v1'
tmux send-keys -t java:v1 'git fetch' C-m
tmux split-window -t java:v1 -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/sdk/java/v1 'hx' 
tmux new-window -c $GHQ_ROOT/github.com/hashgraph/sdk/java/v2 -n 'v2'
tmux send-keys -t java:v2 'git fetch' C-m
tmux split-window -t java:v2 -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/sdk/java/v2 'hx' 

# Javascript
tmux new-session -s javascript -d -x $COLS -y $LINES -c $GHQ_ROOT/github.com/hashgraph/sdk/javascript/v1 -n 'v1'
tmux send-keys -t javascript:v1 'git fetch' C-m
tmux split-window -t javascript:v1 -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/sdk/javascript/v1 'hx' 
tmux new-window -c $GHQ_ROOT/github.com/hashgraph/sdk/javascript/v2 -n 'v2'
tmux send-keys -t javascript:v2 'git fetch' C-m
tmux split-window -t javascript:v2 -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/sdk/javascript/v2 'hx' 

# Go
tmux new-session -s go -d -x $COLS -y $LINES -c $GHQ_ROOT/github.com/hashgraph/sdk/go/v2 -n 'v2'
tmux send-keys -t go:v2 'git fetch' C-m
tmux split-window -t go:v2 -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/sdk/go/v2 'hx' 
tmux new-window -c $GHQ_ROOT/github.com/hashgraph/sdk/go/kernel -n 'kernel'
tmux send-keys -t go:kernel 'git fetch' C-m
tmux split-window -t go:kernel -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/sdk/go/kernel 'hx' 

# Swift
tmux new-session -s swift -d -x $COLS -y $LINES -c $GHQ_ROOT/github.com/hashgraph/sdk/swift/v1 -n 'v1'
tmux send-keys -t swift:v1 'git fetch' C-m
tmux split-window -t swift:v1 -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/sdk/swift/v1 'hx' 

# Rust
tmux new-session -s rust -d -x $COLS -y $LINES -c $GHQ_ROOT/github.com/hashgraph/sdk/rust/v1 -n 'v1'
tmux send-keys -t rust:v1 'git fetch' C-m
tmux split-window -t rust:v1 -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/sdk/rust/v1 'hx' 
tmux new-window -c $GHQ_ROOT/github.com/hashgraph/sdk/rust/proto -n 'proto'
tmux send-keys -t rust:proto 'git fetch' C-m
tmux split-window -t rust:proto -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/sdk/rust/proto 'hx' 
tmux new-window -c $GHQ_ROOT/github.com/hashgraph/sdk/rust/next -n 'next'
tmux send-keys -t rust:next 'git fetch' C-m
tmux split-window -t rust:next -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/sdk/rust/next 'hx' 

# References
tmux new-session -s reference -d -x $COLS -y $LINES -c $GHQ_ROOT/github.com/hashgraph/sdk/reference -n 'main'
tmux send-keys -t reference:main 'git fetch' C-m
tmux split-window -t reference:main -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/sdk/reference 'hx' 

# Portal
tmux new-session -s portal -d -x $COLS -y $LINES -c $GHQ_ROOT/github.com/hashgraph/portal/portal -n 'portal'
tmux send-keys -t portal:portal 'git fetch' C-m
tmux split-window -t portal:portal -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/portal/portal 'hx' 
tmux new-window -c $GHQ_ROOT/github.com/hashgraph/portal/api -n 'api'
tmux send-keys -t portal:api 'git fetch' C-m
tmux split-window -t portal:api -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/portal/api 'hx' 
tmux new-window -c $GHQ_ROOT/github.com/hashgraph/portal/netki -n 'netki'
tmux send-keys -t portal:netki 'git fetch' C-m
tmux split-window -t portal:netki -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/portal/netki 'hx' 
tmux new-window -c $GHQ_ROOT/github.com/hashgraph/portal/admin -n 'admin'
tmux send-keys -t portal:admin 'git fetch' C-m
tmux split-window -t portal:admin -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/portal/admin 'hx' 
tmux new-window -c $GHQ_ROOT/github.com/hashgraph/portal/worker -n 'worker'
tmux send-keys -t portal:worker 'git fetch' C-m
tmux split-window -t portal:worker -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/portal/worker 'hx' 

# Hedera
tmux new-session -s hedera -d -x $COLS -y $LINES -c $GHQ_ROOT/github.com/hashgraph/protobufs -n 'proto'
tmux send-keys -t 'hedera:proto' 'git fetch' C-m
tmux split-window -t 'hedera:proto' -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/protobufs 'hx' 
tmux new-window -c $GHQ_ROOT/github.com/hashgraph/services -n 'services'
tmux send-keys -t hedera:services 'git fetch' C-m
tmux split-window -t hedera:services -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/services 'hx' 
tmux new-window -c $GHQ_ROOT/github.com/hashgraph/docs -n 'docs'
tmux send-keys -t hedera:docs 'git fetch' C-m
tmux split-window -t hedera:docs -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/docs 'hx' 

# Kabuto
tmux new-session -s kabuto -d -x $COLS -y $LINES -c $GHQ_ROOT/github.com/launchbadge/kabuto/kabuto/v5 -n 'v5'
tmux send-keys -t kabuto:v5 'git fetch' C-m
tmux split-window -t kabuto:v5 -h -l '65%' -c $GHQ_ROOT/github.com/launchbadge/kabuto/kabuto/v5 'hx' 
tmux new-window -c $GHQ_ROOT/github.com/launchbadge/kabuto/app -n 'app'
tmux send-keys -t kabuto:app 'git fetch' C-m
tmux split-window -t kabuto:app -h -l '65%' -c $GHQ_ROOT/github.com/launchbadge/kabuto/app 'hx' 

# Side Projects
tmux new-session -s side -d -x $COLS -y $LINES -c $GHQ_ROOT/github.com/launchbadge/sqlx -n 'sqlx'
tmux send-keys -t 'side:sqlx' 'git fetch' C-m
tmux split-window -t 'side:sqlx' -h -l '65%' -c $GHQ_ROOT/github.com/launchbadge/sqlx 'hx' 
tmux new-window -c $GHQ_ROOT/github.com/launchbadge/rho -n 'rho'
tmux send-keys -t side:rho 'git fetch' C-m
tmux split-window -t side:rho -h -l '65%' -c $GHQ_ROOT/github.com/launchbadge/rho 'hx' 

# Configs
tmux new-session -s config -d -x $COLS -y $LINES -c $HOME/.config -n 'config'
tmux send-keys -t 'config:config' 'hx' C-m

tmux attach -t java
