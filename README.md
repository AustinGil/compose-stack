## Instructions:

1. Deploy a server
2. Point domain name to server IP address
3. [Install Dependencies](#deps)
4. Copy/clone source code into server
5. Copy `sample.env` to `.env` and edit variables
6. Bring containers up: `docker-compose up -d`
7. Run certbot (requires .env file and working domain): `docker-compose exec nginx /bin/certbot.sh`

#### Setup a renewal cronjob

1. Open crontab: `docker-compose exec nginx crontab -e`
2. At the bottom, add: `@daily sleep $[ ( $RANDOM % 9000 ) + 1 ]s; certbot renew`

---

### <a name="deps"></a>Dependencies

#### [Docker](https://docs.docker.com/)

Ubuntu:

1.  `sudo apt-get update`
2.  `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`
3.  `sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"`
4.  `sudo apt-get update`
5.  `sudo apt-get install -y docker-ce`
6.  `sudo usermod -aG docker $USER`
7.  Restart terminal session (logout and back in)

CentOS (AWS Linux AMI):

1.  `sudo yum update -y`
2.  `sudo yum install -y docker`
3.  `sudo service docker start`
4.  `sudo usermod -aG docker $USER`
5.  Restart terminal session (logout and back in)

#### [Docker-compose](https://docs.docker.com/compose/install/)

Linux:

1. `sudo curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose`
2. `sudo chmod +x /usr/local/bin/docker-compose`

#### [Git](https://git-scm.com/) (Optional)

Ubuntu:

1. `sudo apt-get install -y git-core`

CentOS (AWS Linux AMI):

1. `sudo yum install -y git`

---

## Helpful Commands

- Restart containers: `docker-compose restart`
- Rebuild containers: `docker-compose build`
- Request certificates: `docker-compose exec nginx certbot certonly --webroot -w /var/lib/certbot/ --agree-tos --non-interactive --text -d example.com --email you@example.com`
- Renew certificates: `docker-compose exec nginx certbot renew`
- Restart NGINX: `docker-compose exec nginx nginx -s reload`
- Access terminal: `docker-compose exec nginx /bin/bash`
