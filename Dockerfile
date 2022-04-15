# for testing purpose only, for now
FROM ubuntu:latest

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en

COPY ./ /root/.config/nvim

RUN apt-get update

RUN apt-get install -yq tzdata && \
    ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get install -y software-properties-common \
    git \
    python3-venv \
    build-essential && \
    add-apt-repository ppa:neovim-ppa/unstable && \
    apt-get install -y neovim

WORKDIR /root/.config/nvim

RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' -c 'COQdeps'
