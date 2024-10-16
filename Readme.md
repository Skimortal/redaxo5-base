# Set permissions for folder (776) and files (777)

`sudo find ./REDAXO -type d -exec chmod 777 {} \; -o -type f -exec chmod 776 {} \;`
