FROM ubuntu:16.10

MAINTAINER 2tom <tera1215@gmail.com>

RUN echo "Asia/Tokyo" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata
RUN locale-gen en_US.UTF-8
ENV LANG en_US.utf8
ENV LC_ALL en_US.UTF-8

# common
RUN apt-get update && apt-get install -y\
 git-core\
 curl\
 unzip\
 build-essential\
 libcurl4-openssl-dev\
 software-properties-common\
 bzip2\
 wget\
 && rm -rf /var/lib/apt/lists/*

ENV HOME /root
ENV NVM_VERS v0.33.1
ENV NODE_VERS v6.10.2
ENV PATH /root/.nvm/$NODE_VERS/bin:$PATH

RUN git clone https://github.com/creationix/nvm.git $HOME/.nvm\
 && cd $HOME/.nvm\
 && git checkout $NVM_VERS

RUN bash -c '. $HOME/.nvm/nvm.sh; nvm install $NODE_VERS && nvm alias default $NODE_VERS'

# Environment configuration
ENV GITBOOK_VERSION="3.2.2"

# Install gitbook and lftp
RUN bash -c '. $HOME/.nvm/nvm.sh\
 ;npm install --global gitbook-cli\
 && gitbook fetch ${GITBOOK_VERSION}\
 && npm cache clear'

# common
RUN apt-get update && apt-get install -y --no-install-recommends --no-install-suggests\
 lftp\
 calibre\
 && rm -rf /var/lib/apt/lists/*

# pkg
RUN apt-get update && apt-get install -y\
 vim\
 && rm -rf /var/lib/apt/lists/*

# Current directory configuration
WORKDIR /gitbook

# Volume for gitbook operations
VOLUME /gitbook

# Ports for serve command
EXPOSE 4000 35729

# Default cmd is version display
CMD /usr/local/bin/gitbook -V
