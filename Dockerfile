FROM alpine

LABEL author="Lupin3000"
LABEL version="1.0"

RUN apk update \
    && apk add --no-cache --virtual .build-deps \
    make gcc git libgcc musl-dev openssl-dev linux-headers curl-dev zlib-dev \
    && git clone https://github.com/ZerBea/hcxtools.git \
    && make -C /hcxtools/ \
    && make install -C /hcxtools/ \
    && rm -fr /hcxtools/ \
    && apk del .build-deps

WORKDIR /hcxpcaptool

ENTRYPOINT ["/usr/local/bin/hcxpcaptool", "-z", "pmkid.16800"]
