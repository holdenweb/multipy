FROM ubuntu:21.10
RUN . /etc/os-release && \
    apt-get update && \
    apt-get install -y gnupg && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F23C5A6CF475977595C89F51BA6932366A755776 
RUN . /etc/os-release && \
    apt-get update && \
    apt-get install -y curl build-essential
RUN . /etc/os-release && \
    curl https://www.python.org/ftp/python/3.10.2/Python-3.10.2.tgz | tar xzf - && \
    ( cd Python-3.10.2 && \
      ./configure && \
      make && \
      make altinstall ) && \
RUN apt-get install -y \
        python2.7 \
        python2.7-dev \
        python3-pip && \
    python3 -m pip install tox virtualenv && \
    apt-get --purge autoremove -y gnupg && \
    rm -rf /var/cache/apt/lists
RUN apt-get install -y curl && \
    (curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3)

