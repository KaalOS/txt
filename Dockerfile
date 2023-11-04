FROM ubuntu:latest
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends git wget pv jq python3-dev ffmpeg mediainfo python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /app/
WORKDIR /app/
RUN pip3 install --no-cache-dir --upgrade --requirement requirements.txt
CMD python3 main.py
