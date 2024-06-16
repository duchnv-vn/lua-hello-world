#!/bin/bash
source .env

EXERCISM_SLUG=$1
WORKING_DIR=$(pwd)/src/exercism/lua/$EXERCISM_SLUG

cd $WORKING_DIR

exercism submit $EXERCISM_SLUG.lua
