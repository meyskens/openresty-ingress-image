ARG arch
FROM maartje/k8s-openresty-ingress-redis:${arch}-d7b76eed44c78920aebe3054195ea66c5b104bf0

RUN git clone https://github.com/cloudflare/lua-resty-logger-socket.git /opt/lua-resty-logger-socket/

RUN luarocks install lua-resty-http
RUN luarocks install dkjson
RUN git clone https://github.com/GUI/lua-resty-auto-ssl.git &&\
    cd lua-resty-auto-ssl &&\
    luarocks make --pack-binary-rock ./lua-resty-auto-ssl-git-1.rockspec &&\
    luarocks install lua-resty-auto-ssl-git-1.*.rock

RUN curl -o /etc/ssl/cacert.pem https://curl.haxx.se/ca/cacert.pem
