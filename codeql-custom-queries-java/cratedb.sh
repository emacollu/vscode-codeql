#!/bin/bash


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

COMMAND="${COMMAND//;/ }"

codeql database create javacominjdb --language=java --command="$COMMAND" --source-root=$SOURCE_JAVA_PRJ --overwrite