#!/bin/bash

# Set JAVA_HOME explicitly for Render
export JAVA_HOME=/opt/render/project/.java/current
export PATH=$JAVA_HOME/bin:$PATH

echo "Using Java from: $JAVA_HOME"
java -version

# Check if Maven is installed, if not install it
if ! command -v mvn &> /dev/null
then
    echo "Installing Maven..."
    curl -fsSL https://archive.apache.org/dist/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.tar.gz | tar -xz
    export PATH=$PWD/apache-maven-3.9.5/bin:$PATH
fi

echo "Maven Version:"
mvn -version

echo "Building the project..."
mvn clean package -DskipTests


