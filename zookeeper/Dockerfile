FROM zookeeper:3.4.14
MAINTAINER Salvo Nicotra
ENV PATH /opt/zkui:$PATH

RUN mkdir -p /opt/zkui
COPY lib/* /opt/zkui
COPY conf/* /opt/zkui
ADD zkui.sh /opt/zkui/zkui


EXPOSE 9090
