#!/bin/bash

#Script to automate the deployment of an application


# Variables
REPO_URL="https://github.com/username/repo.git"
DEPLOY_DIR="/var/www/app"
BACKUP_DIR="/var/www/backup"
LOG_FILE="/var/log/deploy.log"
TIMESTAMP=$(date +"%Y%m%d%H%M%S")

# Functions
log() {
  echo "$TIMESTAMP - $1" >> $LOG_FILE
}


log "Starting deployment"

# Backup current deployment
log "Backing up current deployment"
mkdir -p $BACKUP_DIR
cp -r $DEPLOY_DIR $BACKUP_DIR/app_$TIMESTAMP


log "Fetching the latest code"
cd $DEPLOY_DIR
git pull $REPO_URL

#Install dependencies 
log "Installing dependencies"
npm install


log "Restarting application"
systemctl restart app

log "Deployment finished successfully"
echo "Thank You"

i
