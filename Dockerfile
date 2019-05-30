FROM rocker/binder:latest

## Copies your repo files into the Docker Container
USER root

## Install dependencies
RUN R -q -e 'remotes::install_deps(".")'
