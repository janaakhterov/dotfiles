#!/usr/bin/env bash

if ! command -v ghq &> /dev/null; then
    echo "`ghq` is not installed"
    exit
fi

GHQ_ROOT=$(ghq root)

if ps -e | rg "tmux: server" > /dev/null; then 
    exit
fi

COLS=$(tput cols)
LINES=$(tput lines)

# Hedera Hashgraph

## Java
tmux new-session -s hedera -d -x $COLS -y $LINES -c $GHQ_ROOT/github.com/hashgraph/sdk/java -n 'java'
tmux send-keys -t hedera:java 'git fetch' C-m
tmux split-window -t hedera:java -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/sdk/java 'nvim' 

## Javascript
tmux new-window -c $GHQ_ROOT/github.com/hashgraph/sdk/javascript -n 'javascript'
tmux send-keys -t hedera:javascript 'git fetch' C-m
tmux split-window -t hedera:javascript -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/sdk/javascript 'nvim' 

## Go
tmux new-window -c $GHQ_ROOT/github.com/hashgraph/sdk/go -n 'go'
tmux send-keys -t hedera:go 'git fetch' C-m
tmux split-window -t hedera:go -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/sdk/go 'nvim' 

## Swift
tmux new-window -c $GHQ_ROOT/github.com/hashgraph/sdk/swift -n 'swift'
tmux send-keys -t hedera:swift 'git fetch' C-m
tmux split-window -t hedera:swift -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/sdk/swift 'nvim' 

## Core
tmux new-window -c $GHQ_ROOT/github.com/hashgraph/sdk/core -n 'core'
tmux send-keys -t hedera:core 'git fetch' C-m
tmux split-window -t hedera:core -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/sdk/core 'nvim' 

## References
tmux new-window -c $GHQ_ROOT/github.com/hashgraph/sdk/references -n 'references'
tmux send-keys -t hedera:references 'git fetch' C-m
tmux split-window -t hedera:references -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/sdk/references 'nvim' 

## Protobufs
tmux new-window -c $GHQ_ROOT/github.com/hashgraph/protobufs -n 'protobufs'
tmux send-keys -t hedera:protobufs 'git fetch' C-m
tmux split-window -t hedera:protobufs -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/protobufs 'nvim' 

## Portal
tmux new-window -c $GHQ_ROOT/github.com/hashgraph/portal/portal -n 'portal'
tmux send-keys -t hedera:portal 'git fetch' C-m
tmux split-window -t hedera:portal -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/portal/portal 'nvim' 

## Portal API
tmux new-window -c $GHQ_ROOT/github.com/hashgraph/portal/api -n 'portal-api'
tmux send-keys -t hedera:portal-api 'git fetch' C-m
tmux split-window -t hedera:portal-api -h -l '65%' -c $GHQ_ROOT/github.com/hashgraph/portal/api 'nvim' 

# Swirlds
tmux new-session -s swirlds -d -x $COLS -y $LINES -c $GHQ_ROOT/github.com/swirlds/docker -n 'docker'
tmux send-keys -t swirlds:docker 'git fetch' C-m
tmux split-window -t swirlds:docker -h -l '65%' -c $GHQ_ROOT/github.com/swirlds/docker 'nvim' 
