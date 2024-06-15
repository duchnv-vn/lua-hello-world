#!/bin/bash
source .env

EXERCISM_SLUG=$1
TRACK=lua

exercism download \
    --track=$TRACK \
    --exercise=$EXERCISM_SLUG
