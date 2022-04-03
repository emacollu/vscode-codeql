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

codeql database create javacominjdb --language=java --command="mvn clean install" --source-root=$SOURCE_JAVA_PRJ --overwrite