#!/bin/bash
source .env

WORKSPACE=$(pwd)/src/exercism

exercism configure \
    --token=$EXERCISM_TOKEN \
    --workspace=$WORKSPACE
