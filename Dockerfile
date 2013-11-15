FROM ubuntu
MAINTAINER James Dabbs <jamesdabbs@gmail.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

# For add-apt-repository
RUN apt-get install python-software-properties -y

# For Vim 7.4 on Ubuntu 12.04
RUN add-apt-repository ppa:nmi/vim-snapshots

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y ack-grep
RUN apt-get install -y curl
RUN apt-get install -y git
RUN apt-get install -y man
RUN apt-get install -y sudo
RUN apt-get install -y tree
RUN apt-get install -y vim
RUN apt-get install -y zsh

RUN adduser james --shell /bin/zsh --quiet

