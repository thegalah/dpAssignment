#!/bin/sh
 
# Get the project name
PROJECT_NAME=${1:-laravel}
 
# Install Laravel via Composer
composer create-project laravel/laravel $PROJECT_NAME dev-develop --prefer-dist
 
# Change to the project directory
cd $PROJECT_NAME
 
# Remove Laravel related Markdown
rm -f readme.md
 
# Configure folder permissions
find storage/* -type d -exec chmod 775 {} \; 
