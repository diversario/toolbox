FROM debian:9.7-slim

COPY packages /
COPY 02nocache /etc/apt/apt.conf.d/

RUN apt-get update && \
    apt-get install --no-install-recommends -y $(cat /packages) && \
    apt-get purge -y libx11.* libqt.* && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apt/archives && \
    rm /*.deb && \
    rm -rf /usr/share/vim/vim80/lang /usr/share/vim/vim80/tutor /usr/share/vim/vim80/spell /usr/share/vim/vim80/doc

COPY .inputrc /root/

ENTRYPOINT /bin/bash
