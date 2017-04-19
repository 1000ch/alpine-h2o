FROM    alpine

WORKDIR /alpine-h2o

COPY    . .

RUN     apk --no-cache add --virtual=build-dependencies build-base perl curl cmake zlib-dev wslay-dev libressl-dev libuv-dev yaml-dev && \
        curl -SL https://github.com/h2o/h2o/archive/v2.2.0.tar.gz | tar zx && \
        cd h2o-2.2.0 && \
        cmake -DWITH_BUNDLED_SSL=off && \
        make && \
        make install && \
        apk del build-dependencies && \
        rm -rf /var/cache/apk/*

EXPOSE  3000
