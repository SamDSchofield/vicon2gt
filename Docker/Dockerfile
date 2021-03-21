FROM ros:melodic-perception-bionic

RUN apt-get update && apt-get install -y \
    libboost-all-dev \
    libeigen3-dev \
    libmetis-dev git \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/borglab/gtsam
RUN mkdir -p gtsam/build
RUN cd gtsam/build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DGTSAM_USE_SYSTEM_EIGEN=ON .. && \
    make -j3 && \
    make install && \
    echo 'export LD_LIBRARY_PATH=/usr/local/lib/:$LD_LIBRARY_PATH' >> ~/.bashrc

RUN export LD_LIBRARY_PATH=/usr/local/lib/:$LD_LIBRARY_PATH

RUN apt-get install -y python-catkin-tools

RUN mkdir -p catkin_ws/src
RUN cd catkin_ws/src && git clone https://github.com/SamDSchofield/vicon2gt.git

RUN /bin/bash -c "source /opt/ros/melodic/setup.bash && \
    cd catkin_ws && \
    catkin build"

RUN echo 'source /opt/ros/melodic/setup.bash' >> ~/.bashrc
RUN echo 'source /catkin_ws/devel/setup.bash' >> ~/.bashrc
RUN mkdir bags
