#!/bin/bash

resultdir="results_analysis"
dbname="javacominjdb"

while getopts r:d: flag
do
    case "${flag}" in
        r) resultdir=${OPTARG};;
        d) dbname=${OPTARG};;
    esac
done

if ! [ -d "$resultdir" ]; then
    mkdir $resultdir
fi

NOW=$(date '+%d%m%Y_%H%M%S');

RESULT_FILE="$resultdir/java_results_$NOW.bqrs"
DECODE_FILE="$resultdir/decode_results_$NOW.json"

ARG1=${@:$OPTIND:1}

echo "Run query '$ARG1' to db '$dbname' and save the result of in '$resultdir'"

echo "Run Query..."
codeql query run --database=$dbname --output=$RESULT_FILE -- $ARG1

echo "Decode Result..."
codeql bqrs decode --output=$DECODE_FILE --format=json --entities=all -- $RESULT_FILE