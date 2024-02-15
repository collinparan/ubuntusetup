#!/bin/bash

# Update package index and install required dependencies
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# Add Docker repository
sudo add-apt-repository "deb [arch=arm64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

# Update package index and install Docker CE
sudo apt-get update
sudo apt-get install -y docker-ce

# Install Nano Editor
sudo apt-get install -y nano

# Add current user to the docker group to avoid using sudo when running docker commands
sudo usermod -aG docker $(whoami)

# Print installed versions
echo "Docker version:"
docker --version
echo "Docker Compose version:"
docker compose version

echo "Docker, Docker Compose, and Nano installation completed successfully."
