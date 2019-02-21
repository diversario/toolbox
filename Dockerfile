FROM alpine:3.9

ENV USER=root

COPY packages-alpine.txt /packages.txt

RUN apk --no-cache add $(cat /packages.txt) && \
    rm -rf /usr/share/vim/vim81/doc /usr/share/vim/vim81/spell /usr/share/vim/vim81/tutor

COPY .inputrc /$USER/
COPY .aliases.bash /$USER/
RUN echo 'source ~/.aliases.bash' >> ~/.bashrc
ADD https://raw.githubusercontent.com/diversario/tmux-config/master/.tmux.conf /$USER/

ENTRYPOINT /bin/bash
