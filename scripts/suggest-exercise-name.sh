#!/bin/bash

suggest_exercise_name() {
    WORKING_DIR=$(pwd)/src/exercism/lua
    EXERCISES=""

    for dir in $WORKING_DIR/*; do
        dir_name=$(basename "${dir}")
        EXERCISES=$EXERCISES" $dir_name"
    done

    COMPREPLY=($(compgen -W "$EXERCISES" -- "$2"))
}

complete -F suggest_exercise_name ./scripts/exercism_submit.sh
