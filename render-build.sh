#!/bin/bash

# Ensure JAVA_HOME is set
if [ -d "/opt/render/project/.java" ]; then
    export JAVA_HOME=$(find /opt/render/project/.java -maxdepth 1 -type d | head -n 1)
else
    echo "Java is not installed. Exiting..."
    exit 1
fi

export PATH=$JAVA_HOME/bin:$PATH

echo "Using Java from: $JAVA_HOME"
java -version || { echo "Java is missing. Exiting..."; exit 1; }

# Install Maven if not installed
if ! command -v mvn &> /dev/null
then
    echo "Installing Maven..."
    curl -fsSL https://archive.apache.org/dist/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.tar.gz | tar -xz
    export PATH=$PWD/apache-maven-3.9.5/bin:$PATH
fi

echo "Maven Version:"
mvn -version || { echo "Maven installation failed. Exiting..."; exit 1; }

echo "Building the project..."
mvn clean package -DskipTests || { echo "Build failed. Exiting..."; exit 1; }



