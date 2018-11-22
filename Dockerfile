FROM fedora:latest

RUN echo "fastestmirror=true" >> /etc/dnf/dnf.conf
RUN dnf update -y
RUN dnf install clang svn gcc \
        libxml2-devel cmake make \
        vim git parallel perf \
        xz -y

WORKDIR /usr/local/src

RUN svn co http://llvm.org/svn/llvm-project/llvm/trunk llvm

WORKDIR /usr/local/src/llvm/projects

RUN svn co http://llvm.org/svn/llvm-project/libcxx/trunk libcxx
RUN svn co http://llvm.org/svn/llvm-project/libcxxabi/trunk libcxxabi

WORKDIR /usr/local


CMD /usr/bin/bash --login
