#install CUDA

sudo apt install cuda-toolkit-11-4;

export PATH=/usr/local/cuda-11.4/bin:$PATH;
export LD_LIBRARY_PATH=/usr/local/cuda-11.4/lib64:$LD_LIBRARY_PATH;

sudo apt-get update;
sudo apt-get upgrade;

