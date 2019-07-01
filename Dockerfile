FROM codercom/code-server as coder-binary

FROM ubuntu:18.10 as vscode-env
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y curl && \
    curl -o vscode-amd64.deb -L https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable && \
    dpkg -i vscode-amd64.deb || true && \
    apt-get install -y -f && \
    apt-get install -y libx11-xcb1 libasound2 && \
    rm -f vscode-amd64.deb && \
    apt-get install -y jq

COPY scripts /root/scripts

RUN code -v --user-data-dir /root/.config/Code && \
    cd /root/scripts && \
    sh get-config-from-gist.sh && \
    sh parse-extension-list.sh && \
    sh install-vscode-extensions.sh ../extensions.list

FROM ubuntu:18.10
WORKDIR /project
RUN apt update && apt install -y python3 python3-pip \
    apt-transport-https \
    ca-certificates \
    curl \
    git \
    wget \
    gnupg-agent \
    software-properties-common \
    zsh \
    sudo
RUN adduser --gecos '' --disabled-password coder && \
    echo "coder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd

COPY scripts /tmp/scripts
COPY --from=coder-binary /usr/local/bin/code-server /usr/local/bin/code-server
USER coder
RUN mkdir -p /home/coder/.code-server/User
USER root
COPY --chown=coder:coder --from=vscode-env /root/settings.json /home/coder/.code-server/User/settings.json
COPY --chown=coder:coder --from=vscode-env /root/.vscode/extensions /home/coder/.code-server/extensions
RUN sh /tmp/scripts/install-go-tools.sh
RUN sh /tmp/scripts/install-python-tools.sh
EXPOSE 8443
USER coder
CMD code-server $PWD

