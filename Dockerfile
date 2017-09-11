FROM python:3.6.2

WORKDIR /opt/selenium
ADD ./requirements.txt ./

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - 
RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -y google-chrome-stable && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir -r ./requirements.txt
