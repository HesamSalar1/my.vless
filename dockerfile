FROM alpine:latest

RUN apk update && apk add bash curl wget unzip

# نصب Xray
RUN mkdir -p /xray
WORKDIR /xray
RUN wget https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip Xray-linux-64.zip && \
    chmod +x xray && \
    mv xray /usr/bin/

COPY config.json /etc/xray/config.json

CMD ["xray", "-config", "/etc/xray/config.json"]