# makayel/openssh

Docker image based on [makayel/supervisor](https://github.com/makayel/supervisor).

It include an OpenSSH server and client.

## How to build the image ?
      docker build -t makayel/openssh .

## How to run the container ?
      docker run -d -p 2222:22 --name makayel makayel/openssh

## How to take control of the container ?
      docker exec -ti makayel /bin/bash

      ssh root@localhost -p 2222 #(root/root)
