FROM debian

WORKDIR /usr/src

ADD https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz .

RUN tar -xzf gotty_linux_amd64.tar.gz \
 && cp gotty /usr/bin \
 && rm gotty \
 && rm gotty_linux_amd64.tar.gz \
 && useradd -ms /bin/bash user

USER user

WORKDIR /home/user

COPY ./gotty/.gotty .

CMD ["gotty", "bash"]
