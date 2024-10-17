# Initial settings

* Change container names in docker-dev
* Adapt DB Host in config.yml
* Adapt nginx fastcgi_pass container name

# Build 

`docker-compose build`

# Set permissions for folder (776) and files (777)

`sudo find ./REDAXO -type d -exec chmod 777 {} \; -o -type f -exec chmod 776 {} \;`

# Start container in docker-dev folder



`docker-compose up`

or

`docker-compose up -d`

# Import DB in the data folder

`docker exec -i db-test mysql -u root --password=root redaxo < data/init.sql`
