FROM ubuntu:22.04
RUN . /etc/os-release && \
    apt-get update && \
    apt-get install -y gnupg && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F23C5A6CF475977595C89F51BA6932366A755776 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install build-essential curl gdb lcov pkg-config \
      libbz2-dev libffi-dev libgdbm-dev libgdbm-compat-dev liblzma-dev \
      libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev \
      lzma lzma-dev tk-dev uuid-dev zlib1g-dev && \
    . /etc/os-release && \
    mkdir /pysource
RUN for version in 3.7.14 3.8.14 3.9.14 3.10.7 ; do  \
      cd /pysource && \
      curl https://www.python.org/ftp/python/${version}/Python-${version}.tgz | tar xzf - ; done
RUN for version in 3.7.12 3.8.12 3.9.13 3.10.6 ; do  \
      cd /pysource/Python-${version} && \
      ./configure && \
      make && \
      make altinstall ; done
RUN cd /pysource/Python-3.10.6 && make install && \
    ln -s ./python3.10 /usr/local/bin/python
RUN for version in 3.7.14 3.8.14 3.9.14 3.10.7 ; do  \
      cd /pysource/Python-${version} && \
      make clean ; done
RUN cd /pysource && \
      echo "DOWNLOADING PYTHON" 3.11.0rc2 && \
      curl https://www.python.org/ftp/python/3.11.0/Python-3.11.0rc2.tgz | tar xzf - && \
      cd /pysource/Python-3.11.0rc2 && \
      ./configure && \
      make && \
      make altinstall && \
      make clean
RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH=/root/.local/bin:$PATH

