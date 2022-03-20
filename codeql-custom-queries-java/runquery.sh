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

RESULT_FILE="$RESULT_DIR/java_results_$NOW.bqrs"
DECODE_FILE="$RESULT_DIR/decode_results_$NOW.json"

echo "Run Query..."
codeql query run --database=javacominjdb --output=$RESULT_FILE -- $1

echo "Decode Result..."
codeql bqrs decode --output=$DECODE_FILE --format=json --entities=all -- $RESULT_FILE