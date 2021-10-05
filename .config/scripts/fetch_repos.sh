#!/bin/bash

if ! command -v ghq &> /dev/null; then
    echo "`ghq` is not installed"
    exit
fi

GHQ_ROOT=$(ghq root)

# Java
mkdir -p $GHQ_ROOT/github.com/hashgraph/sdk/java

git clone git@github.com:hashgraph/hedera-sdk-java.git $GHQ_ROOT/github.com/hashgraph/sdk/java/v1 && cd "$_" && git checkout release/1.x && cd -
git clone git@github.com:hashgraph/hedera-sdk-java.git $GHQ_ROOT/github.com/hashgraph/sdk/java/v2

# JS
mkdir -p $GHQ_ROOT/github.com/hashgraph/sdk/javascript

git clone git@github.com:hashgraph/hedera-sdk-js.git $GHQ_ROOT/github.com/hashgraph/sdk/javascript/v1 && cd "$_" && git checkout release/1.x && cd -
git clone git@github.com:hashgraph/hedera-sdk-js.git $GHQ_ROOT/github.com/hashgraph/sdk/javascript/v2

# Go
mkdir -p $GHQ_ROOT/github.com/hashgraph/sdk/go

git clone git@github.com:hashgraph/hedera-sdk-go.git $GHQ_ROOT/github.com/hashgraph/sdk/go/v1 && cd "$_" && git checkout release/1.x && cd -
git clone git@github.com:hashgraph/hedera-sdk-go.git $GHQ_ROOT/github.com/hashgraph/sdk/go/v2

# Portal
mkdir -p $GHQ_ROOT/github.com/hashgraph/portal

git clone git@github.com:hashgraph/hedera-portal.git $GHQ_ROOT/github.com/hashgraph/portal/portal
git clone git@github.com:hashgraph/hedera-portal-api.git $GHQ_ROOT/github.com/hashgraph/portal/api
git clone git@github.com:hashgraph/hedera-portal-netki.git $GHQ_ROOT/github.com/hashgraph/portal/netki
git clone git@github.com:hashgraph/hedera-portal-admin.git $GHQ_ROOT/github.com/hashgraph/portal/admin
git clone git@github.com:hashgraph/hedera-portal-worker.git $GHQ_ROOT/github.com/hashgraph/portal/worker

# Hedera
mkdir -p $GHQ_ROOT/github.com/hashgraph/

git clone git@github.com:hashgraph/hedera-protobufs.git $GHQ_ROOT/github.com/hashgraph/protobufs
git clone git@github.com:hashgraph/hedera-services.git $GHQ_ROOT/github.com/hashgraph/services
git clone git@github.com:hashgraph/hedera-docs.git $GHQ_ROOT/github.com/hashgraph/docs

# Kabuto
mkdir -p $GHQ_ROOT/github.com/launchbadge/kabuto

git clone git@github.com:launchbadge/kabuto.git $GHQ_ROOT/github.com/launchbadge/kabuto/kabuto
git clone git@github.com:danielakhterov/kabuto-app.git $GHQ_ROOT/github.com/launchbadge/kabuto/app

# SQLx
mkdir -p $GHQ_ROOT/github.com/launchbadge/sqlx

git clone git@github.com:launchbadge/sqlx.git $GHQ_ROOT/github.com/launchbadge/sqlx