#!/bin/bash

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

current_dir="`pwd`"
trap "cd \"$current_dir\"" EXIT
pushd "$ROOT" &> /dev/null

if [[ ! -d external/eosjs ]]; then
    mkdir -p external
    cd external
    git clone --branch="wa-experiment" https://github.com/EOSIO/eosjs.git
    cd eosjs
    yarn install
    cd ../..
fi

yarn add file:external/eosjs
yarn install