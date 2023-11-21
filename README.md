Odoo Installation

Requirements

Docker

Ubuntu Linux
Windows


Docker-compose

Linux: sudo apt install docker-compose

Windows: already installed with Docker Desktop




Getting Started

Notes


Make sure you have sufficient free diskspace on your partition, recommendation around 2GB. Running docker-compose will eventually download 1.2GB at the minimum.


Make sure you have installed docker and docker-compose in your system



Steps

Clone / Download this repository git clone {repo_url} odoo13

Open up terminal on the working directory cd odoo13

Checkout odoo13 branch git checkout odoo13

execute docker-compose up -d

Open your browser


Restoring Databases via command line

docker exec -i odoo13_db_1 createdb <DB_NAME> -O odoo -U odoo
cat <BACKUP_FILE> | docker exec -i odoo13_db_1 psql -U odoo -d <DB_NAME>


Running SQL Commands to docker

Connect to the SQL docker exec -i odoo13_db_1 psql -U odoo -d <DB_NAME> 

Execute commands i.e.
update res_users set password = 1 where id = 1;


\q to quit


Adding Modules

Place the modules on the addons directory
Then execute the update module commands


Updating Modules

modify docker-compose.yml file
Add the command line following line


services:
web:
  image: odoo:13.0
  depends_on:
    - db
  command: odoo -d <DB_NAME> -u <MODULE_NAME>
  ports:
    - "8069:8069"



Docker Commands


If Dockerfile has changed, need to rebuild the docker container:
docker-compose up --build


If docker-compose.yml file has changed, need to exec:
docker-compose up
Optional parameter is -d for detach if you don't want to see the logs: docker-compose up -d


If only Odoo/UHH Modules or code has changed, just pull latest source code and restart the Odoo docker container. No need to exec docker-compose up.
Here's the command: docker-compose restart web