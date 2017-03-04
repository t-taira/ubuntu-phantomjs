FROM ubuntu:16.04

# Install.
RUN \
  apt-get update && \
  apt-get install -y python3 python3-pip && \
  pip3 install --upgrade pip && \
  pip3 install selenium && \
  pip3 install beautifulsoup4 && \
  apt-get install -y wget libfontconfig && \
  mkdir -p /home/roor/src && cd $_ && \
  wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
  tar jxvf phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
  cd phantomjs-2.1.1-linux-x86_64/bin && \
  cp phantomjs /usr/local/bin/ && \
  apt-get install -y fonts-migmix

# Add file.
ADD etc/config/local.conf /etc/config/local.conf

# Set environment variables.
ENV LANG ja_JP.UTF-8
ENV PYTHONINENCODIND utf_8

# Define default command.
CMD ["bin/bash"]
