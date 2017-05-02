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
RUN bash -c '. $HOME/.nvm/nvm.sh; nvm use stable ; npm install yo bower grunt-cli gulp -g'\

VOLUME /src

ADD start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 3000
