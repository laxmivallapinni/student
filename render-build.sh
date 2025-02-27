#!/bin/bash

echo "Using Java from: $JAVA_HOME"
java -version || { echo "Error: Java is not installed."; exit 1; }

echo "Installing Maven..."
if ! command -v mvn &> /dev/null
then
    curl -fsSL https://archive.apache.org/dist/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.tar.gz | tar -xz
    export PATH=$PWD/apache-maven-3.9.5/bin:$PATH
fi

echo "Maven version:"
mvn -version || { echo "Error: Maven is not installed."; exit 1; }

echo "Building the project..."
mvn clean install -DskipTests







