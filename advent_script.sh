#!/bin/bash

# Force decimal separator to dot
export LC_NUMERIC=C

if [[ $# -lt 2 ]]; then
    echo "Usage:"
    echo "  $0 {clean|compile|run} {cpp|ts|py|all} [arg] [--measure]"
    exit 1
fi

ACTION="$1"
LANG="$2"
ARG="$3"
MEASURE=false

if [[ "$3" == "--measure" || "$4" == "--measure" ]]; then
    MEASURE=true
    [[ "$3" == "--measure" ]] && ARG=""
fi

run_make() {
    local target="$1"
    shift
    if $MEASURE; then
        echo "Measuring time for: make $target $*"
        START=$(date +%s.%N)
        make "$target" "$@"
        END=$(date +%s.%N)
        DURATION=$(echo "$END - $START" | bc)
        printf "Execution time: %.9f seconds\n" "$DURATION"
    else
        make "$target" "$@"
    fi
}

handle_action() {
    local action="$1"
    local lang="$2"
    local suffix

    case "$action" in
        clean) suffix="clean" ;;
        compile) suffix="compile" ;;
        run) suffix="run" ;;
        *) echo "Invalid action: $action"; exit 1 ;;
    esac

    if [[ "$lang" == "all" ]]; then
        for l in cpp ts py; do
            echo "--- $action $l ---"
            if [[ "$action" == "run" ]]; then
                run_make "${l}_${suffix}" ARGS="$ARG"
            else
                run_make "${l}_${suffix}"
            fi
        done
    else
        target="${lang}_${suffix}"
        if [[ "$action" == "run" ]]; then
            run_make "$target" ARGS="$ARG"
        else
            run_make "$target"
        fi
    fi
}

handle_action "$ACTION" "$LANG"
