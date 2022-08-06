FROM ubuntu:19.04
RUN . /etc/os-release && \
    apt-get update && \
    apt-get install -y gnupg && \
    echo "deb http://ppa.launchpad.net/deadsnakes/ppa/ubuntu bionic  main" > /etc/apt/sources.list.d/deadsnakes.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F23C5A6CF475977595C89F51BA6932366A755776 
RUN . /etc/os-release && \
    apt-get update
RUN . /etc/os-release && \
    for vn in 3.5 3.6 3.7 3.8 3.9 ; \
    do \
        apt-get install -y python${vn} python${vn}-dev python${vn}-venv ;\
    done && \
    apt-get install -y \
        python-pip \
        python3-pip \
        python2.7 \
        python2.7-dev \
    && \
    pip3 install tox virtualenv && \
    apt-get --purge autoremove -y gnupg && \
    rm -rf /var/cache/apt/lists
RUN apt-get install -y curl && \
    (curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python)

