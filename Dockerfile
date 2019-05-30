FROM rocker/binder:latest

## List files
RUN pwd

## List files
RUN ls -la

## Copies your repo files into the Docker Container
USER root

## List files
RUN pwd

## List files
RUN ls -la

## Install dependencies
RUN R -q -e 'remotes::install_deps(".")'
