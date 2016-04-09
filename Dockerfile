FROM centos:7
MAINTAINER Mike Shuey "shuey@fmepnet.org"

ENV GOPATH=/root/work
ADD wipedisk.sh /usr/local/sbin/wipedisk.sh
ADD gitconfig /root/.gitconfig
RUN yum update -y &&\
    yum install -y libibverbs-utils libibverbs-devel libibverbs-devel-static \
        libmlx4 libmlx5 ibutils libibcm libibcommon libibmad libibumad && \
    yum install -y rdma  librdmacm-utils librdmacm-devel librdmacm \
        libibumad-devel perftest && \
    yum install -y net-tools iproute bind-utils tcpdump && \
    yum install -y strace which vim less rsync && \
    yum install -y gdisk && \
    yum install -y git make golang rpm-build && \
    yum clean all && \
    adduser -b /home -s /bin/bash -g users test && \
    mkdir /root/work

ENTRYPOINT /bin/bash
