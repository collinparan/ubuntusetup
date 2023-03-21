#!/bin/bash

# Update package index and install required dependencies
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update package index and install Docker CE
sudo apt-get update
sudo apt-get install -y docker-ce

# Add current user to the docker group to avoid using sudo when running docker commands
sudo usermod -aG docker $(whoami)

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Apply executable permissions to the Docker Compose binary
sudo chmod +x /usr/local/bin/docker-compose

# Print installed versions
echo "Docker version:"
docker --version
echo "Docker Compose version:"
docker-compose --version

echo "Docker and Docker Compose installation completed successfully."

