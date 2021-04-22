FROM alpine:3

ENV USER=root

ENV KUBECTL_VERSION 1.18.16

RUN wget -O /usr/bin/kubectl \
    https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
    && chmod +x /usr/bin/kubectl

COPY packages.txt /packages.txt

RUN apk --no-cache add $(cat /packages.txt) && \
    rm -rf /usr/share/vim/vim81/doc /usr/share/vim/vim81/spell /usr/share/vim/vim81/tutor

COPY .inputrc /$USER/
COPY .aliases.bash /$USER/
RUN echo 'source ~/.aliases.bash' >> ~/.bashrc
ADD https://raw.githubusercontent.com/diversario/tmux-config/master/.tmux.conf /$USER/

ENTRYPOINT /bin/bash
