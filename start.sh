#!/bin/bash

#
# This file should be used to prepare and run your WebProxy after set up your .env file
# Source: https://github.com/evertramos/docker-compose-letsencrypt-nginx-proxy-companion
#

# Check if .env file exists
if [ -e .env ]; then
	source .env
else
	echo "Please set up your .env file before starting your environment."
	exit 1
fi

# Update local images
docker-compose pull

# Add any special configuration if it's set in .env file

# Check if user set to use Special Conf Files
if [ ! -z ${USE_NGINX_CONF_FILES+X} ] && [ "$USE_NGINX_CONF_FILES" = true ]; then

	# Create the conf folder if it does not exists
	mkdir -p $NGINX_FILES_PATH/conf.d

	# Copy the special configurations to the nginx conf folder
	cp -R ./conf.d/* $NGINX_FILES_PATH/conf.d

	# Check if there was an error and try with sudo
	if [ $? -ne 0 ]; then
		sudo cp -R ./conf.d/* $NGINX_FILES_PATH/conf.d
	fi

	# If there was any errors inform the user
	if [ $? -ne 0 ]; then
		echo
		echo "#######################################################"
		echo
		echo "There was an error trying to copy the nginx conf files."
		echo "The webproxy will still work, your custom configuration"
		echo "will not be loaded."
		echo
		echo "#######################################################"
	fi
fi

# Start proxy
docker-compose up
# docker-compose up -d

exit 0
