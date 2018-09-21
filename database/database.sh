#!/usr/bin/env bash

IMAGE_NAME='cassandra-sandbox'

# Usage
# ./database.sh <action>
# Action can be: start, stop, restart

action=$1

if [ "$action" = "start" ]
then
  echo "Starting docker image ${IMAGE_NAME}"
  # Check if image is running already
  DOCKER_PS="$(docker ps | grep ${IMAGE_NAME})"
  
  if [ ! -z "$DOCKER_PS" ]; then
    echo "Database running"
    exit 0
  fi
  
  # Remove current container
  docker container rm $IMAGE_NAME
  
  # Build the docker container using the linked file, tagged as constel-log-db
  docker build -q --rm -t $IMAGE_NAME ./database
  
  # Run the container and expose default ports
  docker run -d -p 9042:9042 --name $IMAGE_NAME $IMAGE_NAME
fi

if [ "$1" = "restart" ]
then
  echo "Restarting docker image ${IMAGE_NAME}"
  docker restart $IMAGE_NAME
fi

if [ "$1" = "stop" ]
then
  echo "Stopping docker image ${IMAGE_NAME}"
  docker stop $IMAGE_NAME
fi

if [ "$1" = "logs"]
then
  echo "Trailing logs from ${IMAGE_NAME}"
  docker logs -f $IMAGE_NAME
fi