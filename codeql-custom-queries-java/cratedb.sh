#!/bin/bash


SOURCE_JAVA_PRJ_line=$(cat .env | grep SOURCE_JAVA_PRJ)

if [[ $SOURCE_JAVA_PRJ_line != \#* ]]; then
    SOURCE_JAVA_PRJ="${SOURCE_JAVA_PRJ_line#SOURCE_JAVA_PRJ=}"
fi

if [ -z "$SOURCE_JAVA_PRJ" ]; then
      echo "\$SOURCE_JAVA_PRJ is empty"
      exit -1
fi

codeql database create javacominjdb --language=java --command="mvn clean install" --source-root=$SOURCE_JAVA_PRJ --overwrite