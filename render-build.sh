#!/bin/bash

echo "Checking if Java is installed..."

# Check if Java is installed
if ! command -v java &> /dev/null
then
    echo "Java is not installed. Installing OpenJDK 17..."
    
    # Download OpenJDK 17
    curl -o openjdk.tar.gz https://download.java.net/openjdk/jdk17/ri/openjdk-17+35_linux-x64_bin.tar.gz
    
    # Create a directory for Java and extract files
    mkdir -p java
    tar -xzf openjdk.tar.gz -C java --strip-components=1
    
    # Set JAVA_HOME and update PATH
    export JAVA_HOME=$PWD/java
    export PATH=$JAVA_HOME/bin:$PATH
    echo "export JAVA_HOME=$JAVA_HOME" >> $HOME/.bashrc
    echo "export PATH=$JAVA_HOME/bin:$PATH" >> $HOME/.bashrc
    
    echo "Java installation complete."
else
    echo "Java is already installed."
fi

# Verify Java installation
echo "Java version:"
java -version || { echo "Error: Java installation failed."; exit 1; }

# Install Maven
echo "Checking if Maven is installed..."
if ! command -v mvn &> /dev/null
then
    echo "Maven is not installed. Installing..."
    curl -o maven.tar.gz https://archive.apache.org/dist/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.tar.gz
    tar -xzf maven.tar.gz
    export MAVEN_HOME=$PWD/apache-maven-3.9.5
    export PATH=$MAVEN_HOME/bin:$PATH
    echo "export MAVEN_HOME=$MAVEN_HOME" >> $HOME/.bashrc
    echo "export PATH=$MAVEN_HOME/bin:$PATH" >> $HOME/.bashrc
    echo "Maven installation complete."
else
    echo "Maven is already installed."
fi

# Verify Maven installation
echo "Maven version:"
mvn -version || { echo "Error: Maven installation failed."; exit 1; }

# Build the project
echo "Building the project..."
mvn clean install -DskipTests || { echo "Error: Build failed."; exit 1; }

# Run the Spring Boot application
echo "Starting the application..."
java -jar target/dataJpa-0.0.1-SNAPSHOT.jar || { echo "Error: Application failed to start."; exit 1; }

