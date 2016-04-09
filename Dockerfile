FROM centos:7
MAINTAINER Mike Shuey "shuey@fmepnet.org"

ADD wipedisk.sh /usr/local/sbin/wipedisk.sh
RUN yum update -y &&\
    yum install -y libibverbs-utils libibverbs-devel libibverbs-devel-static \
        libmlx4 libmlx5 ibutils libibcm libibcommon libibmad libibumad && \
    yum install -y rdma  librdmacm-utils librdmacm-devel librdmacm \
        libibumad-devel perftest && \
    yum install -y net-tools iproute bind-utils tcpdump && \
    yum install -y strace which && \
    yum install -y gdisk && \
    yum install -y git make golang rpm-build && \
    yum clean all && \
    adduser -b /home -s /bin/bash -g users test

ENTRYPOINT /bin/bash
