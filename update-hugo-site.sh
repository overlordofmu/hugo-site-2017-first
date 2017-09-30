#!/bin/sh

hugo_staging=/home/sandbox1/public
nginx_live=/home/nginx/public

##unlock the files/directories
echo unlocking files/directories here: "$nginx_live"
sudo chown -R overlord:http "$nginx_live"
sudo find "$nginx_live" -type d -exec chmod 770 \{\} \+
sudo find "$nginx_live" -type f -exec chmod 660 \{\} \+

## sync
echo "Running: rsync -r $hugo_staging/* $nginx_live"
rsync -r $hugo_staging/* $nginx_live

##lock it up again (note files get locked _before_ directories)
echo re-locking files/directories here: "$nginx_live"
sudo chown -R http: "$nginx_live"
sudo find "$nginx_live" -type f -exec chmod 440 \{\} \+
sudo find "$nginx_live" -type d -exec chmod 550 \{\} \+

echo "complete . . . exiting"
exit 0
