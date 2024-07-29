FROM debian:latest

ENV LANG=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt upgrade -y && \
    apt-get install -y pkg-config software-properties-common ca-certificates npm git wget curl locales \
    && rm -rf /var/lib/apt/lists/* && apt-get autoclean -y && apt-get autoremove -y

WORKDIR /root
RUN npm install -g corepack
WORKDIR /root/prtl-web
COPY . /root/prtl-web/
RUN corepack install
RUN yarn install
ENTRYPOINT [ "yarn", "run", "dev" ]
