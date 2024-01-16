#!/usr/bin/env bash

echo 'Installing Maven-built Java application into the local Maven repository...'
set -x
mvn clean install
set +x

echo 'Extracting project name from pom.xml...'
set -x
NAME=$(mvn help:evaluate -Dexpression=project.name | grep "^[^\[]")
set +x

echo 'Extracting project version from pom.xml...'
set -x
VERSION=$(mvn help:evaluate -Dexpression=project.version | grep "^[^\[]")
set +x

echo 'Running the Java application...'
set -x
java -jar target/${NAME}-${VERSION}.jar
set +x
