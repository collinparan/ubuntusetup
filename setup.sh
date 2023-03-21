(sudo apt update);
(sudo apt install apt-transport-https ca-certificates curl software-properties-common);
(curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -);
(sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable");
(sudo apt install docker-ce);
(sudo usermod -aG docker ${USER});
(DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker} && 
mkdir -p $DOCKER_CONFIG/cli-plugins &&
curl -SL https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose);
(chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose);
(sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose);
(docker compose version);
