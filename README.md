#Fuseki Docker

Builds a docker image with a Fuseki install. Note that the Fuseki version is hardcoded in the HTTP request to the Apache mirror.

##Prerequisites

- Docker
- A Fuseki config file. One is included in this folder; to use your own, replace `config.ttl` with your config and edit the Dockerfile if you are mounting a TDB location other than `/data`

##To build

    $ docker build .

##To run

The file named `config.ttl` will be copied into the image and used as the config file for the Fuseki instance, named `user_config.ttl`. Run like so (where `4c09eec0d47c` is your image ID):

    docker run -d --name fuseki -v <host-fuseki-tdb-location>:/data 4c09eec0d47c

This will expose port 3030 by default.

Override the internally-mounted `/data` folder by using the `-v` flag and passing in the location of your TDB data. Note that the default `config.ttl` file expects the TDB location to be `/data`, so you will have to override that before running the build as well.
