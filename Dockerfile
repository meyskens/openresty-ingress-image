ARG arch
FROM maartje/k8s-openresty-ingress:${arch}-fb30f5f23817667f474cbdbaf4de67ae4367b00d

RUN luarocks install lua-resty-http
RUN luarocks install dkjson
RUN git clone https://github.com/GUI/lua-resty-auto-ssl.git &&\
    cd lua-resty-auto-ssl &&\
    luarocks make --pack-binary-rock ./lua-resty-auto-ssl-git-1.rockspec &&\
    luarocks install lua-resty-auto-ssl-git-1.*.rock

RUN curl -o /etc/ssl/cacert.pem https://curl.haxx.se/ca/cacert.pem
