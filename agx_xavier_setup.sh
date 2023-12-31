#install CUDA
sudo apt-get install apt-utils;
sudo apt-get install curl;

dpkg -l | grep 'nvidia-l4t-core';

sudo apt update;
apt search cuda;

sudo apt install cuda-toolkit-11-4;

export PATH=/usr/local/cuda-11.4/bin:$PATH;
export LD_LIBRARY_PATH=/usr/local/cuda-11.4/lib64:$LD_LIBRARY_PATH;

sudo apt-get update;
sudo apt-get upgrade;

nvcc --version;

nvidia-container-runtime -v;

head -n 1 /etc/nv_tegra_release;

docker run -it --rm --gpus all nvcr.io/nvidia/l4t-base:r32.4.4;

sudo docker run -it --rm --gpus all --net=host --runtime nvidia -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix nvcr.io/nvidia/l4t-base:r35.1.0;

docker run -it --rm --gpus all --net=host --runtime nvidia -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix dustynv/l4t-text-generation:r35.4.1;

