#!/bin/bash

# Update package list
sudo apt update

# Install necessary dependencies
sudo apt install software-properties-common apt-transport-https wget -y

# Import the Microsoft GPG key
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

# Add the Visual Studio Code repository (this step is generally for x86 systems, so we might not use it)
# sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/code stable main"

# Update package list again
sudo apt update

# Download the ARM .deb package
wget https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-arm64 -O vscode-arm64.deb

# Install the downloaded package
sudo apt install ./vscode-arm64.deb

# Fix any dependency issues
sudo apt install -f

# Clean up
rm vscode-arm64.deb

# Confirmation message
echo "Visual Studio Code has been installed successfully."
