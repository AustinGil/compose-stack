## Install [Docker](https://docs.docker.com/)

Ubuntu:

1.  `sudo apt-get update`
2.  `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`
3.  `sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"`
4.  `sudo apt-get update`
5.  `sudo apt-get install -y docker-ce`
6.  `sudo usermod -aG docker $USER`
7.  Restart terminal session

CentOS (AWS Linux AMI):

1.  `sudo yum update -y`
2.  `sudo yum install -y docker`
3.  `sudo service docker start`
4.  `sudo usermod -aG docker $USER`
5.  Restart terminal session

## Install [Docker-compose](https://docs.docker.com/compose/install/)

Linux:

1. `sudo curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose`
2. `sudo chmod +x /usr/local/bin/docker-compose`

## Getting Server Up

1. Setup a server
2. Point domain name to server IP address
3. Copy or clone source code into server
4. Copy sample.env to .env and edit variables
5. Build images: `docker-compose build`
6. Run containers: `docker-compose up`
