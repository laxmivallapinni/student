#!/bin/bash

echo "Checking if Java is installed..."
if ! command -v java &> /dev/null
then
    echo "Java is not available. Setting up JAVA_HOME..."
    export JAVA_HOME=/opt/render/project/.java/current
    export PATH=$JAVA_HOME/bin:$PATH
fi

echo "Java version:"
java -version

echo "Installing Maven..."
if ! command -v mvn &> /dev/null
then
    curl -fsSL https://archive.apache.org/dist/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.tar.gz | tar -xz
    export PATH=$PWD/apache-maven-3.9.5/bin:$PATH
fi

echo "Maven version:"
mvn -version

echo "Building the project..."
mvn clean install -DskipTests






