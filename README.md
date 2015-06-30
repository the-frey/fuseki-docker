#Fuseki Docker

Builds a docker image with a Fuseki install. Note that the Fuseki version is hardcoded in the HTTP request to the Apache mirror.

##Prerequisites

- Docker
- A Fuseki config file. One is included in this folder; to use your own, replace `config.ttl` with your config and edit the Dockerfile if you are mounting a TDB location other than `/data`

##To build

    $ docker build .

##To run

The file named `config.ttl` will be copied into the image and used as the config file for the Fuseki instance, named `config.ttl`, and located at `/opt/fuseki/config/config.ttl`. Run like so (where `<image>` is your image ID):

    docker run -d --name fuseki -v <host-fuseki-tdb-location>:/data <image>

If you are running this, having not built it yourself, you can pass in a config file like so, assuming that your `config.ttl` file is in the folder `<config-folder-location>`:

    docker run -d --name fuseki -v <config-folder-location>:/opt/fuseki/config <image>

This will expose port 3030 by default.

Override the internally-mounted `/data` folder by using the `-v` flag and passing in the location of your TDB data. Note that the default `config.ttl` file expects the TDB location to be `/data`, so you will have to override that before running the build as well.

## JVM Args

Note that the JVM args are being overridden to provide more max swap. Change the `run-fuseki` script if you do not want to do this.
