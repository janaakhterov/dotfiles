#!/bin/bash

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
tmux split-window -t java:v1 -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/sdk/java/v1 'nvim' 
tmux new-window -c $GHQ_ROOT/github.com/hashgraph/sdk/java/v2 -n 'v2'
tmux send-keys -t java:v2 'git fetch' C-m
tmux split-window -t java:v2 -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/sdk/java/v2 'nvim' 

# Javascript
tmux new-session -s javascript -d -x $COLS -y $LINES -c $GHQ_ROOT/github.com/hashgraph/sdk/javascript/v1 -n 'v1'
tmux send-keys -t javascript:v1 'git fetch' C-m
tmux split-window -t javascript:v1 -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/sdk/javascript/v1 'nvim' 
tmux new-window -c $GHQ_ROOT/github.com/hashgraph/sdk/javascript/v2 -n 'v2'
tmux send-keys -t javascript:v2 'git fetch' C-m
tmux split-window -t javascript:v2 -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/sdk/javascript/v2 'nvim' 

# Go
tmux new-session -s go -d -x $COLS -y $LINES -c $GHQ_ROOT/github.com/hashgraph/sdk/go/v2 -n 'v2'
tmux send-keys -t go:v2 'git fetch' C-m
tmux split-window -t go:v2 -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/sdk/go/v2 'nvim' 

# Portal
tmux new-session -s portal -d -x $COLS -y $LINES -c $GHQ_ROOT/github.com/hashgraph/portal/portal -n 'portal'
tmux send-keys -t portal:portal 'git fetch' C-m
tmux split-window -t portal:portal -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/portal/portal 'nvim' 
tmux new-window -c $GHQ_ROOT/github.com/hashgraph/portal/api -n 'api'
tmux send-keys -t portal:api 'git fetch' C-m
tmux split-window -t portal:api -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/portal/api 'nvim' 
tmux new-window -c $GHQ_ROOT/github.com/hashgraph/portal/netki -n 'netki'
tmux send-keys -t portal:netki 'git fetch' C-m
tmux split-window -t portal:netki -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/portal/netki 'nvim' 
tmux new-window -c $GHQ_ROOT/github.com/hashgraph/portal/admin -n 'admin'
tmux send-keys -t portal:admin 'git fetch' C-m
tmux split-window -t portal:admin -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/portal/admin 'nvim' 
tmux new-window -c $GHQ_ROOT/github.com/hashgraph/portal/worker -n 'worker'
tmux send-keys -t portal:worker 'git fetch' C-m
tmux split-window -t portal:worker -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/portal/worker 'nvim' 

# Hedera
tmux new-session -s hedera -d -x $COLS -y $LINES -c $GHQ_ROOT/github.com/hashgraph/protobufs -n 'proto'
tmux send-keys -t 'hedera:proto' 'git fetch' C-m
tmux split-window -t 'hedera:proto' -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/protobufs 'nvim' 
tmux new-window -c $GHQ_ROOT/github.com/hashgraph/services -n 'services'
tmux send-keys -t hedera:services 'git fetch' C-m
tmux split-window -t hedera:services -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/services 'nvim' 
tmux new-window -c $GHQ_ROOT/github.com/hashgraph/docs -n 'docs'
tmux send-keys -t hedera:docs 'git fetch' C-m
tmux split-window -t hedera:docs -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/docs 'nvim' 

# Kabuto
# tmux new-session -s kabuto -d -x $COLS -y $LINES -c $GHQ_ROOT/gitlab.com/launchbadge/kabuto/mirror-schema -n 'schema'
# tmux send-keys -t kabuto:schema 'git fetch' C-m
# tmux split-window -t kabuto:schema -h -l '65%' -c $GHQ_ROOT/gitlab.com/launchbadge/kabuto/mirror-schema 'nvim' 
# tmux new-window -c $GHQ_ROOT/gitlab.com/launchbadge/kabuto/mirror -n 'mirror'
# tmux send-keys -t kabuto:mirror 'git fetch' C-m
# tmux split-window -t kabuto:mirror -h -l '65%' -c $GHQ_ROOT/gitlab.com/launchbadge/kabuto/mirror 'nvim' 
# tmux new-window -c $GHQ_ROOT/gitlab.com/launchbadge/kabuto/mirror-api -n 'api'
# tmux send-keys -t kabuto:api 'git fetch' C-m
# tmux split-window -t kabuto:api -h -l '65%' -c $GHQ_ROOT/gitlab.com/launchbadge/kabuto/mirror-api 'nvim' 
tmux new-session -s kabuto -d -x $COLS -y $LINES -c $GHQ_ROOT/gitlab.com/launchbadge/kabuto/kabuto -n 'v5'
tmux send-keys -t kabuto:v5 'git fetch' C-m
tmux split-window -t kabuto:v5 -h -l '65%' -c $GHQ_ROOT/gitlab.com/launchbadge/kabuto/kabuto 'nvim' 
tmux new-window -c $GHQ_ROOT/github.com/launchbadge/kabuto/app -n 'app'
tmux send-keys -t kabuto:app 'git fetch' C-m
tmux split-window -t kabuto:app -h -l '65%' -c $GHQ_ROOT/github.com/launchbadge/kabuto/app 'nvim' 

# SQLx
tmux new-session -s sqlx -d -x $COLS -y $LINES -c $GHQ_ROOT/github.com/launchbadge/sqlx -n 'sqlx'
tmux send-keys -t 'sqlx:sqlx' 'git fetch' C-m
tmux split-window -t 'sqlx:sqlx' -h -l '65%' -c $GHQ_ROOT/github.com/launchbadge/sqlx 'nvim' 

# Configs
tmux new-session -s config -d -x $COLS -y $LINES -c $HOME/.config/nvim -n 'neovim'
tmux new-window -c $HOME/.config/fish -n 'fish'
tmux new-window -c $HOME/.config/hedera -n 'hedera'
tmux new-window -c $HOME/.config/i3 -n 'i3'
tmux new-window -c $HOME/.config/scripts -n 'scripts'

tmux attach -t java
