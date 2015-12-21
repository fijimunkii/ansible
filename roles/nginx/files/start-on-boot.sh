#!/usr/bin/env bash

docker stop nginx 2>/dev/null ; docker rm nginx 2>/dev/null ; \
docker stop docker-gen 2>/dev/null ; docker rm docker-gen 2>/dev/null ; \
docker run -d -p 80:80 -p 443:443 --name nginx \
  -v /home/ubuntu/nginx.conf:/etc/nginx/nginx.conf \
  -v /home/ubuntu/ssl:/etc/nginx/certs \
  -v /tmp/nginx:/etc/nginx/conf.d \
  -v /home/ubuntu/logs:/var/log/nginx \
  -t nginx && \
docker run -d --volumes-from nginx --name docker-gen \
  -v /var/run/docker.sock:/tmp/docker.sock:ro \
  -v /home/ubuntu/nginx.tmpl:/etc/docker-gen/templates \
  -t jwilder/docker-gen -notify-sighup nginx -watch -only-exposed /etc/docker-gen/templates /etc/nginx/conf.d/default.conf
