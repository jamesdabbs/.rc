## Docker

Create an image from the included `Dockerfile` by running

    docker build -t <name> .

Run a prompt on that machine with

    docker run -i -t <name> /bin/bash

From there, feel free to bootstrap / customize as desired and then commit the changes
(from an alternate pane / while that is running) by doing

    docker ps # to get the image id
    docker commit <id> jdabbs/<name>

## Bootstrapping

From your home directory on a fresh install (with the dependencies specified in the Dockerfile), run

    curl https://raw.github.com/jamesdabbs/.rc/master/bootstrap.sh -o bootstrap.sh
    bash ./bootstrap.sh

This will configure ssh keys, clone this repo, and begin the setup process.

