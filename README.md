### Multipython testbed

This project is a virtual appliance for testing Python programs.
Use it as a base for your testing images, for example.

It currently supports Python 3.7, 3.8, 3.9, 3.10 and 3.11.0rc1,
on arm64 and amd64 architectures.

```
sholden@overhead multipy % docker run -it holdenweb/multipy:1.11 bash
root@804a30e2b886:/# for minor in 7 8 9 10 11
> do
>     python3.${minor} --version
> done
Python 3.7.12
Python 3.8.12
Python 3.9.13
Python 3.10.6
Python 3.11.0rc1
root@804a30e2b886:/# echo $PATH
/root/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```

You can download the latest version of this image from Docker hub with the command

    docker pull holdenweb/multipy:latest
