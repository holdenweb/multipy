FROM ubuntu:22.04
RUN . /etc/os-release && \
    apt-get update && \
    apt-get install -y gnupg && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F23C5A6CF475977595C89F51BA6932366A755776 
RUN . /etc/os-release && \
    apt-get update && \
    apt-get install -y curl build-essential
RUN apt-get install -y zlib1g zlib1g-dev && \
    . /etc/os-release && \
   for version in 3.7.12 3.8.12 3.9.13 3.10.6 ; do  \
    echo "DOWNLOADING PYTHON" ${version} && \
    curl https://www.python.org/ftp/python/${version}/Python-${version}.tgz | tar xzf - ; done
RUN for version in 3.7.12 3.8.12 3.9.13 3.10.6 ; do  \
      cd Python-${version} && \
      ./configure && \
      make && \
      make altinstall && \
      cd .. ; done

