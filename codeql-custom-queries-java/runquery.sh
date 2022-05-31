#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit -1
fi

resultdir="results_analysis"

while getopts d: flag
do
    case "${flag}" in
        d) resultdir=${OPTARG};;
    esac
done

if ! [ -d "$resultdir" ]; then
    mkdir $resultdir
fi

NOW=$(date '+%d%m%Y_%H%M%S');

RESULT_FILE="$resultdir/java_results_$NOW.bqrs"
DECODE_FILE="$resultdir/decode_results_$NOW.json"

ARG1=${@:$OPTIND:1}

echo "Save the result of '$ARG1' in '$resultdir'"

echo "Run Query..."
codeql query run --database=javacominjdb --output=$RESULT_FILE -- $ARG1

echo "Decode Result..."
codeql bqrs decode --output=$DECODE_FILE --format=json --entities=all -- $RESULT_FILE