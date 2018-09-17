## Install [Docker](https://docs.docker.com/)

Ubuntu:

1.  `sudo apt-get update`
2.  `sudo apt-get install \ apt-transport-https \ ca-certificates \ curl \ software-properties-common`
3.  `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`
4.  `sudo add-apt-repository \ "deb [arch=amd64] https://download.docker.com/linux/ubuntu \ $(lsb_release -cs) \ stable"`
5.  `sudo apt-get update`
6.  `sudo apt-get install docker-ce`
7.  `sudo usermod -aG docker $USER`
8.  Restart terminal session

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

1. Edit variables in .env file (unless you want to pass in during run)
2. Build images: `docker-compose build` (optionally accepts environment variables)
3. Run containers: `docker-compose up` (optionally accepts environment variables)
   **Note:** You can also build and run with the same command: `docker-compose up --build`
