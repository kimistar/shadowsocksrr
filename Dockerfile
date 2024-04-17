FROM alpine:3.6

RUN apk --no-cache add python \
    libsodium

ENV SERVER_ADDR     0.0.0.0
ENV SERVER_PORT     1203
ENV PASSWORD        Allen.Wang
ENV METHOD          chacha20-ietf
ENV PROTOCOL        auth_aes128_md5
ENV PROTOCOLPARAM   Freeman
ENV OBFS            tls1.2_ticket_auth_compatible
ENV TIMEOUT         300
ENV DNS_ADDR        8.8.8.8
ENV DNS_ADDR_2      8.8.4.4

COPY . .
#WORKDIR ./shadowsocks

EXPOSE $SERVER_PORT
CMD python ./shadowsocks/server.py -p $SERVER_PORT -k $PASSWORD -m $METHOD -O $PROTOCOL -o $OBFS -G $PROTOCOLPARAM
