FROM opensourcecobol/opensource-cobol

# add zip command
RUN yum install -y zip

# create lambda layer
RUN mkdir -p /lambda/layer/lib
RUN mkdir -p /lambda/layer/bin
RUN cp /usr/lib/libcob.so.1 \
       /usr/lib/libvbisam.so.1 \
       /lib64/libm.so.6 \
       /usr/lib64/libgmp.so.10 \
       /lib64/libncurses.so.5 \
       /lib64/libtinfo.so.5 \
       /lib64/libdl.so.2 \
       /lib64/libc.so.6 \
       /lib64/ld-linux-x86-64.so.2 \
       /lambda/layer/lib
RUN cp /usr/bin/cobc \
       /usr/bin/cobcrun \
       /lambda/layer/bin
RUN cd /lambda/layer && zip -r /lambda-oss-cobol-layer.zip ./lib ./bin

# create lambda function
RUN mkdir -p /lambda/cobol
COPY bootstrap /lambda/cobol
COPY hello.cbl /lambda/cobol
RUN cd /lambda/cobol && cobc hello.cbl
RUN cd /lambda/cobol && zip /lambda-oss-cobol-hello.zip ./bootstrap ./hello.sh ./hello.so

WORKDIR /

ENTRYPOINT [""]
