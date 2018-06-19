FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y python3 python3-pip python3-vtk7

ADD requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt

RUN mkdir /app
WORKDIR /app

ADD kevlar_mesher kevlar_mesher
ADD config.yaml config.yaml

ADD docker/run.sh run.sh

CMD ./run.sh
