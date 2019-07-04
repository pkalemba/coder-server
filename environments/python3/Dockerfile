FROM pkalemba/coder-server:base
USER root
RUN  apt update;apt upgrade ;apt install python3 python3-pip -y
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt
USER coder
