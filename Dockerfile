FROM codercom/code-server as coder-binary
FROM debian:stable-slim
ARG user_uid=1000
ARG user_gid=1001
RUN apt update && apt install -y \
    ca-certificates \
    curl \
    git sudo
RUN addgroup --gid $user_gid coder && \
    adduser --uid $user_uid --gid $user_gid --gecos '' --disabled-password coder && \
    echo "coder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd

COPY --from=coder-binary /usr/local/bin/code-server /usr/local/bin/code-server
COPY extras /tmp/
USER coder
RUN mkdir -p /home/coder/.code-server/User
RUN /usr/local/bin/code-server --install-extension /tmp/code-settings-sync-3.2.9.vsix
COPY entrypoint.sh /entrypoint.sh
WORKDIR /home/coder/project
EXPOSE 8443
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]

