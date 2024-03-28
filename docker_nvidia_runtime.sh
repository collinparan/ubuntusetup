#!/bin/bash

# Define the path for the Docker daemon configuration file and the NVIDIA container runtime
DOCKER_CONFIG_FILE="/etc/docker/daemon.json"
NVIDIA_RUNTIME_PATH="/usr/bin/nvidia-container-runtime"

# Function to install nvidia-container-runtime
install_nvidia_runtime() {
    echo "Attempting to install nvidia-container-runtime..."
    sudo apt-get update
    sudo apt-get install -y nvidia-container-runtime
}

# Check if the NVIDIA container runtime is installed
if [ ! -f "$NVIDIA_RUNTIME_PATH" ]; then
    echo "The NVIDIA container runtime was not found at $NVIDIA_RUNTIME_PATH."
    while true; do
        read -p "Do you want to install the NVIDIA container runtime? (y/n) " yn
        case $yn in
            [Yy]* ) install_nvidia_runtime; break;;
            [Nn]* ) echo "Please install the NVIDIA container runtime manually and ensure it is accessible at $NVIDIA_RUNTIME_PATH."; exit 1;;
            * ) echo "Please answer yes or no.";;
        esac
    done
    if [ ! -f "$NVIDIA_RUNTIME_PATH" ]; then
        echo "Installation failed or the NVIDIA container runtime is still not accessible at $NVIDIA_RUNTIME_PATH."
        exit 1
    fi
fi

# Backup the existing Docker daemon configuration file
if [ -f "$DOCKER_CONFIG_FILE" ]; then
    echo "Backing up existing Docker daemon configuration..."
    sudo cp $DOCKER_CONFIG_FILE "${DOCKER_CONFIG_FILE}.backup_$(date +%Y%m%d%H%M%S)"
else
    echo "No existing Docker daemon configuration file found."
fi

# Write the new configuration to the Docker daemon configuration file
echo "Writing new configuration to the Docker daemon configuration file..."
sudo tee $DOCKER_CONFIG_FILE > /dev/null <<EOF
{
    "runtimes": {
        "nvidia": {
            "path": "$NVIDIA_RUNTIME_PATH",
            "runtimeArgs": []
        }
    },
    "default-runtime": "nvidia"
}
EOF

# Restart the Docker service
echo "Restarting Docker to apply changes..."
sudo systemctl restart docker

echo "Docker has been configured to use NVIDIA as the default runtime."
sudo nvidia-container-runtime -v
sudo cat /etc/docker/daemon.json
