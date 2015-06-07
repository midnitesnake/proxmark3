FROM ubuntu:14.04
MAINTAINER midnitesnake <midnitesnake@gmail.com>

ENV HOME /opt/proxmark3

RUN apt-get update && apt-get install -y subversion p7zip build-essential libreadline5 libreadline-dev libusb-0.1-4 libusb-dev libqt4-dev perl pkg-config wget 
ENV PATH = $PATH:/opt/devkitARM/bin/

WORKDIR /opt
CMD cd $WORKDIR

RUN git clone --depth=1 https://github.com/midnitesnake/proxmark3.git && \
	cd proxmark3 && \
        mv devkitARM ../ && \
	./configure && \
	make

CMD /bin/bash
