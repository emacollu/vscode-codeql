#!/bin/bash

dbname="javacominjdb"

while getopts s:c:d: flag
do
    case "${flag}" in
        s) sourcedir=${OPTARG};;
        c) cmd=${OPTARG};;
        d) dbname=${OPTARG};;
    esac
done

if [ -z "$sourcedir" ]; then
    SOURCE_JAVA_PRJ_line=$(cat .env | grep SOURCE_JAVA_PRJ)

    for OUTPUT in $SOURCE_JAVA_PRJ_line
    do
        if [[ $OUTPUT != \#* ]]; then
            SOURCE_JAVA_PRJ="${OUTPUT#SOURCE_JAVA_PRJ=}"
            break
        fi
    done

    if [ -z "$SOURCE_JAVA_PRJ" ]; then
        echo "\$SOURCE_JAVA_PRJ is empty"
        exit -1
    fi
    sourcedir=$SOURCE_JAVA_PRJ
fi


if [ -z "$cmd" ]; then
    COMMAND_line=$(cat .env | grep COMMAND)

    for OUTPUT in $COMMAND_line
    do
        if [[ $OUTPUT != \#* ]]; then
            COMMAND="${OUTPUT#COMMAND=}"
            break
        fi
    done

    if [ -z "$COMMAND" ]; then
        echo "\$COMMAND is empty"
        exit -1
    fi

    cmd="${COMMAND//;/ }"
fi

codeql database create $dbname --language=java --command="$cmd" --source-root=$sourcedir --overwrite