#! /bin/bash -e

echo "Hello $USER."
echo "Checking for a Docker and Docker-Compose installation."

# Verify if docker is installed.
if ! docker --version; then 
       echo "ERROR: Docker not found."
       echo "Installing Docker from get.docker.com"
       curl -fsSL https://get.docker.com -o get-docker.sh
       sh get-docker.sh

	   echo "Installing docker-compose from docs.docker.com/compose/install/"
		COMPOSE_VERSION=`git ls-remote https://github.com/docker/compose | grep refs/tags | grep -oE "[0-9]+\.[0-9][0-9]+\.[0-9]+$" | sort --version-sort | tail -n 1`
		sudo sh -c "curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
		sudo chmod +x /usr/local/bin/docker-compose
		sudo sh -c "curl -L https://raw.githubusercontent.com/docker/compose/${COMPOSE_VERSION}/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"
	exit 1

fi

echo "Great!! Docker and Docker-Compose are installed."


