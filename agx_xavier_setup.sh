#install CUDA
sudo apt-get install apt-utils;
sudo apt-get install curl;

dpkg -l | grep 'nvidia-l4t-core';

sudo apt install cuda-toolkit-11-4;

export PATH=/usr/local/cuda-11.4/bin:$PATH;
export LD_LIBRARY_PATH=/usr/local/cuda-11.4/lib64:$LD_LIBRARY_PATH;

sudo apt-get update;
sudo apt-get upgrade;

nvcc --version;

nvidia-container-runtime -v;


