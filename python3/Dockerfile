FROM ubuntu:16.10
MAINTAINER 2tom <tera1215@gmail.com>

RUN echo "Asia/Tokyo" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

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

# python3
RUN apt-get update && apt-get install -y\
 python3-dev\
 && rm -rf /var/lib/apt/lists/*

# python pip install
RUN wget https://bootstrap.pypa.io/get-pip.py\
&& python3 get-pip.py\
&& rm get-pip.py


