#!/bin/bash
docker build -t lambda-oss-cobol:latest .
docker run -it --rm -v `pwd`:/tmp lambda-oss-cobol cp /lambda-oss-cobol-hello.zip /lambda-oss-cobol-layer.zip /tmp/

