FROM ubuntu:latest


RUN apt-get update && \
    apt-get install -y python3 python3-pip xz-utils 

RUN pip3 install -i https://mirrors.aliyun.com/pypi/simple/ Flask


COPY s6-overlay-noarch.tar.xz /tmp/s6-overlay-noarch.tar.xz
RUN tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz
COPY s6-overlay-x86_64.tar.xz /tmp/s6-overlay-x86_64.tar.xz
RUN tar -C / -Jxpf /tmp/s6-overlay-x86_64.tar.xz

COPY app.py /app/app.py
COPY app2.py /app/app2.py

COPY flask-run /etc/services.d/flask/run
RUN chmod +x /etc/services.d/flask/run

COPY flask-run-2 /etc/services.d/flask2/run
RUN chmod +x /etc/services.d/flask2/run

WORKDIR /app

EXPOSE 5001
EXPOSE 5002

ENTRYPOINT ["/init"]
