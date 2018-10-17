FROM alpine:3.6

MAINTAINER Carles Amigó, carles.amigo@rakuten.com

ENV REDIR_VERSION=2.2.1

RUN apk add --update --no-cache alpine-sdk dumb-init && \
    curl http://sammy.net/~sammy/hacks/redir-${REDIR_VERSION}.tar.gz | tar xvz && \
    gcc /redir-${REDIR_VERSION}/redir.c -o /usr/bin/redir && \
    strip /usr/bin/redir && \
    rm -rf /redir-${REDIR_VERSION} && \
    apk del alpine-sdk

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD /usr/bin/redir
