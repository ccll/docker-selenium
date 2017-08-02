FROM python:3.6.2

WORKDIR /opt/selenium
ADD . .
RUN apt-key add ./linux_signing_key.pub
RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -y google-chrome-stable && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir -r ./requirements.txt
