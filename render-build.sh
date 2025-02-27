#!/bin/bash

echo "Checking if Java is installed..."
if ! command -v java &> /dev/null
then
    echo "Java is not installed. Installing OpenJDK 17..."
    curl -o openjdk.tar.gz https://download.java.net/openjdk/jdk17/ri/openjdk-17+35_linux-x64_bin.tar.gz
    mkdir -p java
    tar -xzf openjdk.tar.gz -C java --strip-components=1
    echo "export JAVA_HOME=$PWD/java" >> $HOME/.bashrc
    echo "export PATH=$JAVA_HOME/bin:$PATH" >> $HOME/.bashrc
fi

# Load Java paths
source $HOME/.bashrc

# Verify Java installation
echo "Java version:"
java -version || { echo "Error: Java installation failed."; exit 1; }

# Install Maven
echo "Installing Maven..."
if ! command -v mvn &> /dev/null
then
    curl -fsSL https://archive.apache.org/dist/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.tar.gz | tar -xz
    export PATH=$PWD/apache-maven-3.9.5/bin:$PATH
fi

echo "Maven version:"
mvn -version || { echo "Error: Maven installation failed."; exit 1; }

# Build the project
echo "Building the project..."
mvn clean install -DskipTests
