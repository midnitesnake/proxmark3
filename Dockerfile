FROM ubuntu:14.04
MAINTAINER midnitesnake <midnitesnake@gmail.com>

ENV HOME /opt/proxmark3

RUN apt-get update && apt-get install -y subversion p7zip build-essential libreadline5 libreadline-dev libusb-0.1-4 libusb-dev libqt4-dev perl pkg-config wget 
RUN wget -O devkitARM_r43-i686-linux.tar.bz2 http://downloads.sourceforge.net/project/devkitpro/devkitARM/devkitARM_r43-i686-linux.tar.bz2?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fdevkitpro%2Ffiles%2FdevkitARM%2F\\&ts=1433196529\\&use_mirror=heanet 
RUN tar -jxf devkitARM_r43-i686-linux.tar.bz2 -C /opt/
ENV PATH = $PATH:/opt/devkitARM/bin/

WORKDIR /opt
CMD cd $WORKDIR

RUN git clone --depth=1 https://github.com/midnitesnake/proxmark3.git && \
	cd proxmark3 && \
	./configure && \
	make

CMD /bin/bash
