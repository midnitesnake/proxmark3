FROM ubuntu:14.04
MAINTAINER midnitesnake <midnitesnake@gmail.com>

ENV HOME /opt/proxmark3

RUN apt-get update && apt-get upgrade -y && apt-get install -y git build-essential libreadline5 libreadline-dev libusb-0.1-4 libusb-dev libqt4-dev pkg-config wget gcc-arm-none-eabi 

WORKDIR /opt
CMD cd $WORKDIR

RUN git clone --depth=1 https://github.com/midnitesnake/proxmark3.git && \
	cd proxmark3 && \
	./configure && \
	make

CMD /bin/bash
