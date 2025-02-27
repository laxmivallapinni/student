#!/bin/bash

echo "Checking if Java is installed..."
if ! command -v java &> /dev/null
then
    echo "Java is not installed. Installing OpenJDK 17..."
    curl -fsSL https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.tar.gz | tar -xz
    export JAVA_HOME=$PWD/jdk-17.0.*
    export PATH=$JAVA_HOME/bin:$PATH
fi

echo "Java version:"
java -version || { echo "Failed to install Java"; exit 1; }

echo "Installing Maven..."
if ! command -v mvn &> /dev/null
then
    curl -fsSL https://archive.apache.org/dist/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.tar.gz | tar -xz
    export PATH=$PWD/apache-maven-3.9.5/bin:$PATH
fi

echo "Maven version:"
mvn -version || { echo "Failed to install Maven"; exit 1; }

echo "Building the project..."
mvn clean install -DskipTests







