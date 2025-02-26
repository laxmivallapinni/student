#!/bin/bash
echo "Installing Maven..."
apt-get update && apt-get install -y maven
echo "Building the project..."
mvn clean package -DskipTests
