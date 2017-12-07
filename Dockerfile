# Use phusion/baseimage as base image. To make your builds
# reproducible, make sure you lock down to a specific version, not
# to `latest`! See
# https://github.com/phusion/baseimage-docker/blob/master/Changelog.md
# for a list of version numbers.

# http://phusion.github.io/baseimage-docker/

FROM phusion/baseimage:0.9.22

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# ...put your own build instructions here...
RUN apt-get update
RUN apt-get -y install python3-pip

RUN echo "alias python=python3" >> ~/.bashrc
RUN echo "alias pip=pip3" >> ~/.bashrc
# RUN source ~/.bashrc
COPY requirements.txt /

RUN pip3 install -r requirements.txt
# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/bin/bash"]
