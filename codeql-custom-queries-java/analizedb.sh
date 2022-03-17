#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit -1
fi

RESULT_DIR="results_analysis"

if ! [ -d "$RESULT_DIR" ]; then
    mkdir $RESULT_DIR
fi

NOW=$(date '+%d%m%Y_%H%M%S');

RESULT_FILE="$RESULT_DIR/java_results_$NOW.csv"

codeql database analyze javacominjdb $1 --format=csv --output=$RESULT_FILE --rerun