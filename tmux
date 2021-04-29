#!/bin/bash

# Java
tmux new-session -s java -d -c ~/.ghq/gitlab.com/launchbadge/hedera/sdk/java/v1 -n 'v1'
tmux send-keys -t java:v1 'git fetch' C-m
tmux split-window -h -t java:v1 -l '85%' -c ~/.ghq/gitlab.com/launchbadge/hedera/sdk/java/v1 'nvim' 
tmux new-window -c ~/.ghq/gitlab.com/launchbadge/hedera/sdk/java/v2 -n 'v2'
tmux send-keys -t java:v2 'git fetch' C-m
tmux split-window -t java:v2 -h -l '85%' -c ~/.ghq/gitlab.com/launchbadge/hedera/sdk/java/v2 'nvim' 

# Javascript
tmux new-session -s javascript -d -c ~/.ghq/gitlab.com/launchbadge/hedera/sdk/javascript/v1 -n 'v1'
tmux send-keys -t javascript:v1 'git fetch' C-m
tmux split-window -h -t javascript:v1 -l '85%' -c ~/.ghq/gitlab.com/launchbadge/hedera/sdk/javascript/v1 'nvim' 
tmux new-window -c ~/.ghq/gitlab.com/launchbadge/hedera/sdk/javascript/v2 -n 'v2'
tmux send-keys -t javascript:v2 'git fetch' C-m
tmux split-window -t javascript:v2 -h -l '85%' -c ~/.ghq/gitlab.com/launchbadge/hedera/sdk/javascript/v2 'nvim' 

# Go
tmux new-session -s go -d -c ~/.ghq/gitlab.com/launchbadge/hedera/sdk/go/v1 -n 'v1'
tmux send-keys -t go:v1 'git fetch' C-m
tmux split-window -h -t go:v1 -l '85%' -c ~/.ghq/gitlab.com/launchbadge/hedera/sdk/go/v1 'nvim' 
tmux new-window -c ~/.ghq/gitlab.com/launchbadge/hedera/sdk/go/v2 -n 'v2'
tmux send-keys -t go:v2 'git fetch' C-m
tmux split-window -t go:v2 -h -l '85%' -c ~/.ghq/gitlab.com/launchbadge/hedera/sdk/go/v2 'nvim' 

# Kabuto
tmux new-session -s kabuto -d -c ~/.ghq/gitlab.com/launchbadge/kabuto/mirror-schema -n 'schema'
tmux send-keys -t kabuto:schema 'git fetch' C-m
tmux split-window -h -t kabuto:schema -l '85%' -c ~/.ghq/gitlab.com/launchbadge/kabuto/mirror-schema 'nvim' 
tmux new-window -c ~/.ghq/gitlab.com/launchbadge/kabuto/mirror -n 'mirror'
tmux send-keys -t kabuto:mirror 'git fetch' C-m
tmux split-window -t kabuto:mirror -h -l '85%' -c ~/.ghq/gitlab.com/launchbadge/kabuto/mirror 'nvim' 
tmux new-window -c ~/.ghq/gitlab.com/launchbadge/kabuto/mirror-api -n 'api'
tmux send-keys -t kabuto:api 'git fetch' C-m
tmux split-window -t kabuto:api -h -l '85%' -c ~/.ghq/gitlab.com/launchbadge/kabuto/mirror-api 'nvim' 
tmux new-window -c ~/.ghq/gitlab.com/launchbadge/kabuto/kabuto -n 'v5'
tmux send-keys -t kabuto:v5 'git fetch' C-m
tmux split-window -t kabuto:v5 -h -l '85%' -c ~/.ghq/gitlab.com/launchbadge/kabuto/kabuto 'nvim' 
tmux new-window -c ~/.ghq/github.com/danielakhterov/kabuto-app -n 'app'
tmux send-keys -t kabuto:app 'git fetch' C-m
tmux split-window -t kabuto:app -h -l '85%' -c ~/.ghq/github.com/danielakhterov/kabuto-app 'nvim' 

# SQLx
tmux new-session -s sqlx -d -c ~/.ghq/github.com/launchbadge/sqlx -n 'sqlx'
tmux send-keys -t 'sqlx:sqlx' 'git fetch' C-m
tmux split-window -h -t 'sqlx:sqlx' -l '85%' -c ~/.ghq/github.com/launchbadge/sqlx 'nvim' 

# Protobufs
tmux new-session -s proto -d -c ~/.ghq/github.com/hashgraph/hedera-protobufs -n 'hashgraph'
tmux send-keys -t 'proto:hashgraph' 'git fetch' C-m
tmux split-window -h -t 'protobufs:hashgraph' -l '85%' -c ~/.ghq/github.com/hashgraph/hedera-protobufs 'nvim' 
tmux new-window -c ~/.ghq/github.com/danielakhterov/hedera-protobufs -n 'mine'
tmux send-keys -t proto:mine 'git fetch' C-m
tmux split-window -t proto:mine -h -l '85%' -c ~/.ghq/github.com/danielakhterov/hedera-protobufs 'nvim' 

# Services
tmux new-session -s services -d -c ~/.ghq/github.com/hashgraph/hedera-services -n 'hashgraph'
tmux send-keys -t 'services:hashgraph' 'git fetch' C-m
tmux split-window -h -t 'services:hashgraph' -l '85%' -c ~/.ghq/github.com/hashgraph/hedera-services 'nvim' 

tmux attach -t java
