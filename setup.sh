#!/bin/sh

#
# a simple way to parse shell script arguments
# 
# please edit and use to your hearts content
# 

function usage() {
    echo "This is the dockertex installation script v1.0."
    echo ""
    echo "This script installs dockertex to your computer. You have two options for the installation method."
    echo "Either build the image from scratch with the help from the supplied Dockerfile or just pull the image"
    echo "from my public repo (dentra/dockertex) on DockerHub."
    echo ""
    echo "Possible arguments:"
    echo "\t-h --help\tDisplays this message"
    echo "\t-b --build\tUses the Dockerfile to build the dockertex image. This process could take up to an hour."
    echo "\t-p --pull\tPulls the image from Docker hub (dentra/dockertex) (> 4GB)"
    echo ""
}

function displayUsageMessage() {
  echo "Dockertex - Info: To run LaTex commands from inside the container just prepend your commands with 'dockertex'. E.g."
  echo "\t$ dockertex pdflatex example.tex"
}

function copyExecutable() {
  echo ""
  echo "Dockertex - Info: Copy exectuable script to /usr/local/bin"
  cp ./dockertex /usr/local/bin/dockertex
  displayUsageMessage
}

function build() {
    echo "Dockertex - Info: Building images from Dockerfile -> This could take up to an hour."
    echo ""
    docker build -t dentra/dockertex .
    copyExecutable
}

function pull() {
    echo "Dockertex - Info: Pulling dentra/dockertex from dockerhub (> 4GB)"
    echo ""
    docker pull dentra/dockertex:latest
    copyExecutable
}

while [ true ]; do
    PARAM=`echo $1 | awk -F= '{print $1}'`
    VALUE=`echo $1 | awk -F= '{print $2}'`
    case $PARAM in
        -h | --help)
            usage
            exit
            ;;
        -b | --build)
            build
            exit
            ;;
        -p | --pull)
            pull
            exit
            ;;
        *)
            echo "Dockertex - ERROR: unknown parameter \"$PARAM\""
            echo ""
            usage
            exit 1
            ;;
    esac
    shift
done
