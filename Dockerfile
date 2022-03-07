FROM golang:alpine

RUN apk -U upgrade \
    && apk add git make \
    && git clone https://git.zx2c4.com/wireguard-go /tmp/wireguard-go \
    && cd /tmp/wireguard-go \
    && make

FROM alpine:latest

COPY --from=0 /tmp/wireguard-go/wireguard-go /usr/local/bin/wireguard-go
COPY setup-wireguard.sh /root/setup-wireguard.sh
COPY my_wrapper_script.sh /root/my_wrapper_script.sh


RUN apk -U upgrade \
    && apk add --no-cache wireguard-tools iptables ip6tables \
    && chmod +x /root/*.sh

CMD /root/my_wrapper_script.sh