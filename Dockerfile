FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \ 
    apt-get install -y --no-install-recommends apt-utils && \
    apt-get install -y git \
                       make \
                       bash \
                       gcc \
                       build-essential \
                       python2.7 \
                       wget \
                       curl

RUN apt-get install -y libc6-i386 \
                       libusb-0.1-4 \
                       libgconf-2-4 \
                       libncurses5 \
                       libpython2.7 \
                       libtinfo5

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN mkdir -p /tmp/ccs/
RUN curl -L https://software-dl.ti.com/ccs/esd/CCSv10/CCS_10_4_0/exports/CCS10.4.0.00006_linux-x64.tar.gz -o /tmp/ccs/ccs10.4.0.tar.gz --silent && \
    tar xvf /tmp/ccs/ccs10.4.0.tar.gz --directory /tmp/ccs/

RUN ./tmp/ccs/CCS10.4.0.00006_linux-x64/ccs_setup_10.4.0.00006.run --prefix /opt/ccs1004/ --enable-components PF_MSP430 --mode unattended

# Clean archive files
 RUN rm -f /tmp/ccs/ccs10.4.0.tar.gz

# Install compiler
RUN mkdir -p /tmp/ccs/
RUN curl -L https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-p4jWEYpR8n/21.6.0.LTS/ti_cgt_msp430_21.6.0.LTS_linux-x64_installer.bin -o /tmp/ccs/ti_cgt_msp430_21.6.0.LTS_linux-x64_installer.bin --silent && \
    chmod +x ./tmp/ccs/ti_cgt_msp430_21.6.0.LTS_linux-x64_installer.bin && \
    ./tmp/ccs/ti_cgt_msp430_21.6.0.LTS_linux-x64_installer.bin --prefix /opt/ti/ --mode unattended 

ENV PATH="/opt/ccs1004/ccs/eclipse:${PATH}"

RUN apt install -y vim

RUN mkdir /workspace
WORKDIR /workspace

ADD .bashrc /root/.bashrc
ADD compile.sh /root/compile.sh

# CCS12
# https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-J1VdearkvK/12.0.0/CCS12.0.0.00009_linux-x64.tar.gz