FROM ubuntu:18.04

RUN apt-get update && apt-get install -y curl git make libssl1.0-dev build-essential

RUN apt-get update && apt-get install -y liblua5.3-dev lua5.3 m4
RUN apt-get install --no-install-recommends software-properties-common -y
RUN add-apt-repository ppa:vbernat/haproxy-2.2
RUN apt-get install haproxy=2.2.\* -y
RUN apt install make -y

RUN lua5.3 -v
RUN apt install curl luarocks -y
RUN luarocks install --server=http://rocks.moonscript.org luajwt
RUN luarocks install luasec
RUN luarocks install lua-cjson 2.1.0-1
RUN luarocks install http
RUN luarocks install luajson

RUN /bin/bash -c "$(curl -sL https://deb.nodesource.com/setup_14.x)"

RUN apt update && apt install nodejs -y

RUN node -v

RUN npm -v

RUN haproxy -v

RUN cat /etc/haproxy/haproxy.cfg
