FROM 2tom/ubuntu
MAINTAINER 2tom <tera1215@gmail.com>

# python3
RUN apt-get update && apt-get install -y\
 python3-dev\
 && rm -rf /var/lib/apt/lists/*

# pip install
RUN wget https://bootstrap.pypa.io/get-pip.py -O get-pip.py\
 && python3 get-pip.py\
 && rm get-pip.py

## pip3 upgrade
RUN pip install --upgrade pip

# numpy install
RUN pip install numpy

# matplotlib install
RUN pip install matplotlib

# opencv pkgs
RUN apt-get update && apt-get install -y\
 cmake\
 libgtk2.0-dev\
 pkg-config\
 libavcodec-dev\
 libavformat-dev\
 libswscale-dev\
 libtbb2\
 libtbb-dev\
 libjpeg-dev\
 libpng-dev\
 libtiff-dev\
 libjasper-dev\
 libdc1394-22-dev\
 libc6-dev\
 && rm -rf /var/lib/apt/lists/*

RUN cd ~\
 && git clone git://github.com/opencv/opencv\
 && cd opencv\
 && git checkout 3.1.0

RUN cd ~\
 && git clone git://github.com/opencv/opencv_contrib\
 && cd opencv_contrib\
 && git checkout 3.1.0

RUN mkdir ~/opencv/build

RUN cd ~/opencv/build\
 && cmake\
 -D CMAKE_BUILD_TYPE=RELEASE\
 -D CMAKE_INSTALL_PREFIX=/usr/local\
 -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules\
 -D BUILD_EXAMPLES=ON\
 -D INSTALL_PYTHON_EXAMPLES=ON\
 -D ENABLE_PRECOMPILED_HEADERS=OFF\
 ..

#RUN cmake -D CMAKE_BUILD_TYPE=RELEASE\
# -D BUILD_PYTHON_SUPPORT=ON\
# -D CMAKE_INSTALL_PREFIX=/usr/local\
# -D INSTALL_C_EXAMPLES=ON\
# -D INSTALL_PYTHON_EXAMPLES=ON\
# -D OPENCV_EXTRA_MODULES_PATH=/opencv_contrib/modules\
# -D BUILD_EXAMPLES=ON\
# -D BUILD_NEW_PYTHON_SUPPORT=ON\
# -D WITH_IPP=OFF\
# -D WITH_V4L=ON ..

RUN cd ~/opencv/build\
 && make -j4\
 && make install\
 && sh -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf' \
 && ldconfig


# scipy, pandas, scikit-learn
RUN pip3 install scipy pandas scikit-learn

# jupyter install
RUN pip install jupyter
RUN pip install ipython[notebook]

# jupyter and ipython config create
RUN jupyter notebook --generate-config

# jupyter setup
RUN echo "c.NotebookApp.ip = '*'" >>/root/.jupyter/jupyter_notebook_config.py\
&& echo "c.NotebookApp.open_browser = False" >>/root/.jupyter/jupyter_notebook_config.py

# script for startup
ADD init.sh /usr/local/bin/init.sh
RUN chmod u+x /usr/local/bin/init.sh

RUN apt-get update && apt-get install -y\
 python3-tk\
 && rm -rf /var/lib/apt/lists/*

CMD ["/usr/local/bin/init.sh"]
