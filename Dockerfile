FROM ubuntu:20.04
#ENTRYPOINT ["cd"]
#CMD ["/home/abalasub/Working/Dependencies/hdf5-bld/build"]
RUN cd /home && \
    mkdir hdf5-bld && \
    cd hdf5-bld && \
    mkdir build && \
    mkdir install && \
    apt update && \
#    apt install -y wget && \
    apt install -y vim && \
    wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8/hdf5-1.8.13/src/hdf5-1.8.13.tar.gz && \
    tar -xzvf hdf5-1.8.13.tar.gz && \
    rm hdf5-1.8.13.tar.gz && \
    cd build && \
    apt install -y build-essential && \
    apt-get install -y manpages-dev && \
    ../hdf5-1.8.13/configure --enable-shared --prefix=/home/hdf5-bld/install && \
    make && \
    make check && \
    make install
