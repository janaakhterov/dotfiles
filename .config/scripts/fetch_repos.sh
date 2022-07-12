#!/bin/env bash

if ! command -v ghq &> /dev/null; then
    echo "`ghq` is not installed"
    exit
fi

GHQ_ROOT=$(ghq root)

# SDK
mkdir -p $GHQ_ROOT/github.com/hashgraph/sdk

git clone git@github.com:hashgraph/hedera-sdk-java.git $GHQ_ROOT/github.com/hashgraph/sdk/java
git clone git@github.com:hashgraph/hedera-sdk-js.git $GHQ_ROOT/github.com/hashgraph/sdk/javascript
git clone git@github.com:hashgraph/hedera-sdk-go.git $GHQ_ROOT/github.com/hashgraph/sdk/go
git clone git@github.com:hashgraph/hedera-sdk-swift.git $GHQ_ROOT/github.com/hashgraph/sdk/swift
git clone git@github.com:hashgraph/hedera-sdk-core.git $GHQ_ROOT/github.com/hashgraph/sdk/core
git clone git@github.com:hashgraph/hedera-sdk.git $GHQ_ROOT/github.com/hashgraph/sdk/reference

# Portal
mkdir -p $GHQ_ROOT/github.com/hashgraph/portal

git clone git@github.com:hashgraph/hedera-portal.git $GHQ_ROOT/github.com/hashgraph/portal/portal
git clone git@github.com:hashgraph/hedera-portal-api.git $GHQ_ROOT/github.com/hashgraph/portal/api

git clone git@github.com:hashgraph/hedera-protobufs.git $GHQ_ROOT/github.com/hashgraph/protobufs
git clone git@github.com:hashgraph/hedera-services.git $GHQ_ROOT/github.com/hashgraph/services
git clone git@github.com:hashgraph/hedera-docs.git $GHQ_ROOT/github.com/hashgraph/docs
