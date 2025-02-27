#!/bin/bash

# Install Maven if not installed
if ! command -v mvn &> /dev/null
then
    echo "Installing Maven..."
    curl -fsSL https://archive.apache.org/dist/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.tar.gz | tar -xz
    export PATH=$PWD/apache-maven-3.9.5/bin:$PATH
fi

echo "Building the project..."
mvn clean package -DskipTests
