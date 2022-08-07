FROM ubuntu:22.04
RUN . /etc/os-release && \
    apt-get update && \
    apt-get install -y gnupg && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F23C5A6CF475977595C89F51BA6932366A755776 
RUN . /etc/os-release && \
    apt-get update && \
    apt-get install -y curl build-essential
RUN apt-get install -y checkinstall zlib1g zlib1g-dev wget openssl libssl-dev && \
    . /etc/os-release && \
    mkdir /pysource && \
    cd /pysource && \
    curl -sSL https://install.python-poetry.org
RUN for version in 3.7.12 3.8.12 3.9.13 3.10.6 ; do  \
      cd /pysource && \
      echo "DOWNLOADING PYTHON" ${version} && \
      curl https://www.python.org/ftp/python/${version}/Python-${version}.tgz | tar xzf - ; done
RUN for version in 3.7.12 3.8.12 3.9.13 3.10.6 ; do  \
      cd /pysource/Python-${version} && \
      ./configure && \
      make && \
      make altinstall ; done
RUN cd /pysource/Python-3.10.6 && make install && \
    ln -s ./python3.10 /usr/local/bin/python
#RUN cd /pysource && python3 get-poetry.py
