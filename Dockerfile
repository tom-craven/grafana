FROM ubuntu:latest

# capture build arguements
ARG USER
ARG USER_GROUP
ENV WORK_DIR=/usr/local

# take explicit control of the timezone as universal for now
ENV TZ=Etc/Universal
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# update the distribution and get the latest security patched
RUN apt-get -y update
RUN apt-get -y upgrade

RUN ["apt-get", "install", "-y", "apt-transport-https","software-properties-common","wget"]
WORKDIR $WORK_DIR
RUN wget https://dl.grafana.com/oss/release/grafana-7.3.7.linux-amd64.tar.gz
RUN echo "f761a69dbd79744bf0557252d7163b9f42ea24c050206a3995a9bd27d54b5914  grafana-7.3.7.linux-amd64.tar.gz" | sha256sum -c -
RUN tar -zxvf grafana-7.3.7.linux-amd64.tar.gz && cd grafana-7.3.7

# mkcert SSL for encryption in flight
#RUN git clone https://github.com/FiloSottile/mkcert \
#&& cd mkcert \
#&& ./mkcert -install

#RUN sudo apt-get install grafana
WORKDIR $WORK_DIR/grafana-7.3.7
EXPOSE 3000

#define non-root user and group
ARG USER
ARG USER_GROUP
RUN addgroup --gid $USER_GROUP graphana
RUN adduser --disabled-password --gecos '' --uid $USER --gid $USER graphana
RUN chown -R $USER .
USER graphana

ENTRYPOINT ["./bin/grafana-server" ,"web"]


