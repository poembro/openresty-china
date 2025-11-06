FROM docker.1ms.run/openresty/openresty:alpine

WORKDIR /data/web/openresty-china

RUN addgroup www && adduser www -G www  -D -H

COPY ./ /data/web/openresty-china/


RUN mkdir -p /data/cache
RUN mkdir -p /data/log


EXPOSE 18080

CMD ["/usr/local/openresty/nginx/sbin/nginx","-c", "/data/web/openresty-china/conf/nginx.conf"]
